CLASS /dmo/cl_sc3_osm_handler DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES: BEGIN OF ts_osm_address,
             hotel         TYPE string,
             house_number  TYPE string,
             road          TYPE string,
             neighbourhood TYPE string,
             suburb        TYPE string,
             city          TYPE string,
             county        TYPE string,
             state         TYPE string,
             postcode      TYPE string,
             country       TYPE string,
             country_code  TYPE string,
           END OF ts_osm_address,
           BEGIN OF ts_osm_data,
             place_id     TYPE string,
             licence      TYPE string,
             osm_type     TYPE string,
             osm_id       TYPE string,
             "boundingbox  TYPE /ui2/cl_json=>json,
             lat          TYPE string,
             lon          TYPE string,
             display_name TYPE string,
             class        TYPE string,
             type         TYPE string,
             importance   TYPE p LENGTH 8 DECIMALS 14,
             icon         TYPE string,
             address      TYPE ts_osm_address,
           END OF ts_osm_data,
           tt_osm_data TYPE STANDARD TABLE OF ts_osm_data WITH DEFAULT KEY,
            " Replaced with table definition
*           BEGIN OF ts_businesspartner,
*             id          TYPE /dmo/sc3bpid,
*             name        TYPE /dmo/sc3bpname,
*             country     TYPE /dmo/sc3country,
*             countrycode TYPE /dmo/sc3countrycode,
*             city        TYPE /dmo/sc3city,
*             postcode    TYPE /dmo/sc3postcode,
*             road        TYPE /dmo/sc3road,
*             housenumber TYPE /dmo/sc3housenumber,
*             s4bpid      TYPE /dmo/sc3s4bpid,
*           END OF ts_businesspartner,
           ts_businesspartner TYPE /dmo/tsc3bp,
           tt_businesspartner TYPE STANDARD TABLE OF ts_businesspartner WITH KEY id.
    TYPES: tt_city TYPE RANGE OF /dmo/sc3city.

    CLASS-METHODS:
      search_for_businesspartner
        IMPORTING iv_city            TYPE /dmo/sc3city
                  is_paging          TYPE if_a4c_rap_query_request=>ts_paging OPTIONAL
        EXPORTING et_businesspartner TYPE tt_businesspartner
                  ev_total_count     TYPE int8
        RAISING   /dmo/cx_sc3_bp,
      get_businesspartner_by_id
        IMPORTING iv_id              TYPE /dmo/sc3bpid
        EXPORTING es_businesspartner TYPE /dmo/tsc3bp
        RAISING   /dmo/cx_sc3_bp.

  PROTECTED SECTION.

  PRIVATE SECTION.
    CONSTANTS: gc_url              TYPE string VALUE 'http://nominatim.openstreetmap.org',
               gc_url_search_path  TYPE string VALUE '/search?',
               gc_url_reverse_path TYPE string VALUE '/reverse?'.

    CLASS-METHODS:
      get_osm_data_by_uri_path
        IMPORTING iv_uri_path TYPE string
        EXPORTING et_osm_data TYPE tt_osm_data
        RAISING   /dmo/cx_sc3_bp,

      trans_osm_data_2_bp
        IMPORTING it_osm_data        TYPE tt_osm_data
                  iv_city            TYPE string OPTIONAL
        EXPORTING et_businesspartner TYPE tt_businesspartner
        RAISING   /dmo/cx_sc3_bp,

      add_known_s4_partner
        CHANGING ct_businesspartner TYPE tt_businesspartner.

ENDCLASS.



CLASS /DMO/CL_SC3_OSM_HANDLER IMPLEMENTATION.


  METHOD add_known_s4_partner.
    IF ct_businesspartner IS NOT INITIAL.
      SELECT * FROM /dmo/tsc3bp
               FOR ALL ENTRIES IN @ct_businesspartner
               WHERE id = @ct_businesspartner-id
               INTO TABLE @DATA(lt_known_bp).
      SORT lt_known_bp BY id.
      LOOP AT ct_businesspartner REFERENCE INTO DATA(lr_businesspartner).
        READ TABLE lt_known_bp WITH KEY id = lr_businesspartner->id
             REFERENCE INTO DATA(lr_known_bp) BINARY SEARCH.
        IF sy-subrc = 0.
          "lr_businesspartner->s4bpid = lr_known_bp->s4bpid.
          MOVE-CORRESPONDING lr_known_bp->* to lr_businesspartner->*.
        ENDIF.
      ENDLOOP.
    ENDIF.
  ENDMETHOD.


  METHOD get_businesspartner_by_id.
    CLEAR es_businesspartner.
    DATA lv_uri_path        TYPE string.
    DATA lv_uri_part_query  TYPE string.
    DATA lv_uri_part_params TYPE string VALUE 'format=json&polygon=0&addressdetails=1&limit=1'.
    CONCATENATE lv_uri_part_query 'osm_id=' iv_id '&osm_type=N&' INTO lv_uri_part_query.
    CONCATENATE gc_url_reverse_path lv_uri_part_query lv_uri_part_params INTO lv_uri_path.
    get_osm_data_by_uri_path( EXPORTING iv_uri_path = lv_uri_path
                              IMPORTING et_osm_data = DATA(lt_osm_data) ).
    trans_osm_data_2_bp( EXPORTING it_osm_data        = lt_osm_data
                         IMPORTING et_businesspartner = DATA(et_businesspartner) ).
    CASE lines( et_businesspartner ).
      WHEN 0.
        RAISE EXCEPTION TYPE /dmo/cx_sc3_bp MESSAGE e004(/dmo/sc3) WITH iv_id.
      WHEN 1.
        READ TABLE et_businesspartner INTO es_businesspartner INDEX 1.
      WHEN OTHERS.
        RAISE EXCEPTION TYPE /dmo/cx_sc3_bp MESSAGE e005(/dmo/sc3) WITH iv_id.
    ENDCASE.
  ENDMETHOD.


  METHOD get_osm_data_by_uri_path.

    CLEAR et_osm_data.

*    Example: https://nominatim.openstreetmap.org/search?q=Hotels%20New%20York%20&format=json&polygon=0&addressdetails=1&limit=1
*    "OSM result will look like this:
*    "[
*    "   {
*    "      "place_id":"130400376",
*    "      "licence":"Data © OpenStreetMap contributors, ODbL 1.0. http:\/\/www.openstreetmap.org\/copyright",
*    "      "osm_type":"way",
*    "      "osm_id":"265147728",
*    "      "boundingbox":[  ],
*    "      "lat":"40.76447735",
*    "      "lon":"-73.9744895761588",
*    "      "display_name":"Plaza Hotel, 768, 5th Avenue, Upper East Side, Manhattan, Manhattan Community Board 5, New York County, NYC, New York, 10035, United States of America",
*    "      "class":"tourism",
*    "      "type":"hotel",
*    "      "importance":0.58151155186229,
*    "      "icon":"http:\/\/nominatim.openstreetmap.org\/images\/mapicons\/accommodation_hotel2.p.20.png",
*    "      "address":{
*    "         "hotel":"Plaza Hotel",
*    "         "house_number":"768",
*    "         "road":"5th Avenue",
*    "         "neighbourhood":"Upper East Side",
*    "         "suburb":"Manhattan",
*    "         "city":"NYC",
*    "         "county":"New York County",
*    "         "state":"New York",
*    "         "postcode":"10035",
*    "         "country":"United States of America",
*    "         "country_code":"us"
*    "      }
*    "   },
*    "   ...
*    "   ...
*    "   ...
*    "]

    TRY.

        "http://nominatim.openstreetmap.org/search?q=Hotels Berlin &format=json&polygon=0&addressdetails=1&limit=20
        "DATA(lo_destination) = cl_http_destination_provider=>create_by_url( i_url = gc_url && iv_uri_path ).

        DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination(
                                 i_name                  = 'OSM_NOMINATIM_NOAUTH'
                                 i_service_instance_name = 'space-travel-destination'
                               ).
        DATA(lo_web_client) = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

        lo_web_client->get_http_request( )->set_uri_path( iv_uri_path ).

        DATA(lo_web_response) = lo_web_client->execute( if_web_http_client=>get ).
        DATA(lv_web_result) = lo_web_response->get_text( ).
        lo_web_client->close( ).
        DATA(ls_status) = lo_web_response->get_status( ).
        IF ls_status-code NE 200.
          DATA lv_reason TYPE c LENGTH 100.
          lv_reason = ls_status-reason.
          RAISE EXCEPTION TYPE /dmo/cx_sc3_bp MESSAGE e002(/dmo/sc3) WITH 'Open Street Map' ls_status-code lv_reason(50) lv_reason+50(50) ##NO_TEXT.
        ENDIF.

        IF lv_web_result IS INITIAL.
          RETURN.
        ENDIF.
        IF lv_web_result(1) <> '['.
          "in case of singular object -> create top-level array with one entry
          lv_web_result = '[' && lv_web_result && ']'.
        ENDIF.

        "de-serialize osm data
        CALL TRANSFORMATION /dmo/trsc3osmser
                            SOURCE XML lv_web_result
                            RESULT     places = et_osm_data
                            OPTIONS    value_handling = 'accept_decimals_loss'.

        "use only Nodes, no Ways
        DELETE et_osm_data WHERE osm_type <> 'node'        "( -> reverse search needs "osm_type=N")
                              OR address-hotel IS INITIAL. "only hotels with hotel address -> BP Name

      CATCH cx_root INTO DATA(lx_exc).
        RAISE EXCEPTION TYPE /dmo/cx_sc3_bp MESSAGE e003(/dmo/sc3) WITH 'Open Street Map' ##NO_TEXT
          EXPORTING
            previous = lx_exc.
    ENDTRY.

  ENDMETHOD.


  METHOD search_for_businesspartner.

    CLEAR et_businesspartner.
    DATA lv_uri_path        TYPE string.
    DATA lv_uri_query       TYPE string.
    DATA lv_uri_part_params TYPE string.
    DATA lv_max_rows        TYPE i.
    lv_max_rows = is_paging-maximum_rows.
    IF lv_max_rows IS INITIAL.
      lv_max_rows = 20.
    ENDIF.
    "TODO: offset currently ignored

    "Problem: we need only entries of osm_type "Note".
    "Unfortunately you cannot filter for the type
    "(1) Workaround: Read 10 times more rows than requested
    DATA(lv_read_rows) = lv_max_rows * 10.
    lv_uri_part_params = |&format=json&polygon=0&addressdetails=1&limit={ lv_read_rows }|.

    lv_uri_path = gc_url_search_path.
    CONCATENATE 'q=Hotels' iv_city INTO lv_uri_query SEPARATED BY space.
    CONCATENATE lv_uri_path lv_uri_query lv_uri_part_params INTO lv_uri_path.

    get_osm_data_by_uri_path( EXPORTING iv_uri_path = lv_uri_path
                              IMPORTING et_osm_data = DATA(lt_osm_data) ).

    trans_osm_data_2_bp( EXPORTING it_osm_data        = lt_osm_data
                                   iv_city            = iv_city
                         IMPORTING et_businesspartner = et_businesspartner ).

    "(1) Workaround: reduce the result set down to max rows
    ev_total_count = LINES( et_businesspartner ).
    LOOP AT et_businesspartner REFERENCE INTO DATA(lr_businesspartner).
      IF sy-tabix >= lv_max_rows.
        DELETE et_businesspartner INDEX sy-tabix.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.


  METHOD trans_osm_data_2_bp.

    DATA ls_businesspartner TYPE ts_businesspartner.
    CLEAR et_businesspartner.

    LOOP AT it_osm_data REFERENCE INTO DATA(lr_osm_data).

      IF lr_osm_data->osm_id        IS NOT INITIAL AND
         lr_osm_data->address-hotel IS NOT INITIAL.

        IF lr_osm_data->address-city IS NOT INITIAL.
          ls_businesspartner-city = lr_osm_data->address-city.
        ELSE.
          ls_businesspartner-city = iv_city.
        ENDIF.

        ls_businesspartner-id          = lr_osm_data->osm_id.
        ls_businesspartner-name        = lr_osm_data->address-hotel.
        ls_businesspartner-country     = lr_osm_data->address-country.
        ls_businesspartner-countrycode = lr_osm_data->address-country_code.
        ls_businesspartner-postcode    = lr_osm_data->address-postcode.
        ls_businesspartner-road        = lr_osm_data->address-road.
        ls_businesspartner-housenumber = lr_osm_data->address-house_number.

        INSERT ls_businesspartner INTO TABLE et_businesspartner.
      ENDIF.
    ENDLOOP.

    "add persisted S/4 business partner reference
    add_known_s4_partner( CHANGING ct_businesspartner = et_businesspartner ).

  ENDMETHOD.
ENDCLASS.
