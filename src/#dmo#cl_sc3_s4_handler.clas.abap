CLASS /dmo/cl_sc3_s4_handler DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES: BEGIN OF ts_business_data,
             bp      TYPE STANDARD TABLE OF /dmo/a_businesspartner        WITH DEFAULT KEY,
             bp_addr TYPE STANDARD TABLE OF /dmo/a_businesspartneraddress WITH DEFAULT KEY,
           END OF ts_business_data.

    TYPES: BEGIN OF ts_key_data,
             businesspartner TYPE /dmo/a_businesspartner-businesspartner,
           END OF ts_key_data.

    TYPES:
      BEGIN OF ts_s4_bp_address,
        country     TYPE string,
        street_name TYPE string,
        postal_code TYPE string,
        city_name   TYPE string,
      END OF ts_s4_bp_address,
      BEGIN OF ts_s4_bp,
        business_partner_category TYPE string,
        organization_name         TYPE string,
        business_partner_address  TYPE ts_s4_bp_address,
      END OF ts_s4_bp .

    METHODS:
      business_partner_exists
        IMPORTING iv_bp_id         TYPE /dmo/sc3bpid
        RETURNING VALUE(rv_exists) TYPE abap_bool
        RAISING   /dmo/cx_sc3_bp,

      business_partner_count
        IMPORTING iv_bp_fvalue    TYPE string OPTIONAL
                  iv_bp_fparam    TYPE string OPTIONAL
        RETURNING VALUE(rv_count) TYPE i
        RAISING   /dmo/cx_sc3_bp,

      create_business_partner
        IMPORTING is_businesspartner TYPE /dmo/cl_sc3_osm_handler=>ts_businesspartner
        RETURNING VALUE(rv_s4bpid)   TYPE /dmo/sc3s4bpid
        RAISING   /dmo/cx_sc3_bp.

  PRIVATE SECTION.

**********************************************************************
    CONSTANTS gc_service_base_path TYPE string VALUE '/sap/opu/odata/sap/API_BUSINESS_PARTNER' ##NO_TEXT.
    CONSTANTS gc_destination TYPE string VALUE 'E1Y_BASIC' ##NO_TEXT.
    CONSTANTS gc_srv_instance_name TYPE a4c_cp_svc_instance_name VALUE 'space-travel-destination' ##NO_TEXT.
**********************************************************************
    CLASS-DATA mt_bp_addressdata TYPE /dmo/tsc3bp .
    DATA mv_csrf_token TYPE string .
    DATA go_web_client TYPE REF TO if_web_http_client .

    METHODS get_bp_service_client
      IMPORTING
        !iv_uri_parameter TYPE string OPTIONAL
      RETURNING
        VALUE(ro_client)  TYPE REF TO if_web_http_client
      RAISING
        /dmo/cx_sc3_bp .
    METHODS get_bp_json
      IMPORTING
        !is_business_partner TYPE /dmo/cl_sc3_osm_handler=>ts_businesspartner
      RETURNING
        VALUE(rv_json)       TYPE string .
ENDCLASS.



CLASS /dmo/cl_sc3_s4_handler IMPLEMENTATION.


  METHOD business_partner_count.

    TRY.
        DATA(lo_web_client) = me->get_bp_service_client( '/$count' ).
        DATA(lo_response) = lo_web_client->execute( i_method = if_web_http_client=>get ).
        rv_count = lo_response->get_text( ).

      CATCH cx_web_http_client_error cx_web_message_error INTO DATA(lx_exc).
        RAISE EXCEPTION TYPE /dmo/cx_sc3_bp MESSAGE e003(/dmo/sc3) WITH 'S/4HANA Cloud system' ##NO_TEXT
           EXPORTING
             previous = lx_exc.
    ENDTRY.

  ENDMETHOD.


  METHOD business_partner_exists.

  ENDMETHOD.


  METHOD create_business_partner.
    DATA ls_businesspartner TYPE /dmo/cl_sc3_osm_handler=>ts_businesspartner.

    TRY.
        " Convert data to S/4 BuPa JSON format
        MOVE-CORRESPONDING is_businesspartner TO ls_businesspartner.
        TRANSLATE ls_businesspartner-countrycode TO UPPER CASE.
        DATA(lv_bp_json) = me->get_bp_json( ls_businesspartner ).

        DATA(lo_http_client) = me->get_bp_service_client( ).
        DATA(lo_http_request) = lo_http_client->get_http_request( ).

        " set values on HTTP Request
        lo_http_request->set_header_field( i_name = if_web_http_header=>accept i_value = if_web_http_header=>accept_application_json ).
        lo_http_request->set_header_field( i_name = if_web_http_header=>content_type i_value = if_web_http_header=>accept_application_json ).
        lo_http_request->set_text( lv_bp_json ).
        lo_http_client->set_csrf_token( ).

        DATA(lo_response) = lo_http_client->execute( if_web_http_client=>post ).

        DATA(ls_status) = lo_response->get_status( ).
        IF ls_status-code EQ if_web_http_status=>created.
          DATA(lr_data) = /ui2/cl_json=>generate( json = lo_response->get_text( ) ).
          /ui2/cl_data_access=>create( ir_data = lr_data iv_component = 'd-businesspartner' )->value( IMPORTING ev_data = rv_s4bpid ).
          MODIFY /dmo/tsc3bp FROM @is_businesspartner.
        ELSE.
          RAISE EXCEPTION TYPE /dmo/cx_sc3_bp MESSAGE e000(/dmo/sc3) WITH |Business Partner not created. Response from S/4 was: | |{ ls_status-code } { ls_status-reason }.|.
          rv_s4bpid = '-1'.
        ENDIF.

        lo_http_client->close( ).

      CATCH cx_web_http_client_error INTO DATA(lx_web_ex).
        RAISE EXCEPTION TYPE /dmo/cx_sc3_bp MESSAGE e000(/dmo/sc3) WITH |HTTP Client inetrnal error.| EXPORTING previous = lx_web_ex.
    ENDTRY.


*    DATA:
*      lo_request     TYPE REF TO if_web_http_request,
*      lv_return_code TYPE i.
*    TRY.
*
*        "get odata client for business partner
*        DATA(lo_web_client) = me->get_bp_service_client( ).
*
*        " set header values
*        lo_web_client->get_http_request( )->set_header_field(
*           EXPORTING
*             i_name  = 'Accept' ##NO_TEXT
*             i_value = 'application/json'
*         ).
*        lo_web_client->get_http_request( )->set_header_field(
*           EXPORTING
*             i_name  = 'Content-Type' ##NO_TEXT
*             i_value = 'application/json'
*         ).
*
*        lo_web_client->set_csrf_token( ).
*
*        DATA(lo_proxy) = cl_web_odata_client_factory=>create_v2_remote_proxy(
*          EXPORTING
*            iv_service_definition_name = '/DMO/SDS4BPAPI'
*            io_http_client             = lo_web_client
*            iv_relative_service_root   = '/sap/opu/odata/sap/API_BUSINESS_PARTNER' ).
*
*        DATA(ls_bp) = VALUE /dmo/a_businesspartner(
*                              "businesspartner        = is_businesspartner-id
*                              businesspartnercategory = '2'  " hard coded because 2 equals a company
*                              organizationbpname1     = is_businesspartner-name ).
*        DATA ls_bp_response TYPE /dmo/a_businesspartner.
*
*        DATA(lo_create_request) = lo_proxy->create_resource_for_entity_set( 'A_BUSINESSPARTNER' )->create_request_for_create( ).
*        lo_create_request->set_business_data( ls_bp ).
*        lo_create_request->execute( )->get_business_data( IMPORTING es_business_data = ls_bp_response ).
*
*        IF ls_bp_response-businesspartner IS INITIAL.
*          RAISE EXCEPTION TYPE /dmo/cx_sc3_bp MESSAGE e012(/dmo/sc3).
*        ENDIF.
*
**       adding an address to an existing business partner currently not working
**       1) OData Client Proxy does not support deep inserts
**       2) BP-API will create the address only using deep insert (providing BP and BP-adresse in one call)
*
***       try to insert address for bp -> does not work
***       ls_bp_response-businesspartner = '1000670'. "test data
**        DATA(ls_bp_addr) = VALUE /dmo/a_businesspartneraddr(
**                              businesspartner = ls_bp_response-businesspartner
**                              country         = to_upper( is_businesspartner-countrycode )
**                              postalcode      = is_businesspartner-postcode
**                              cityname        = is_businesspartner-city
**                              streetname      = |{ is_businesspartner-road } { is_businesspartner-housenumber }| ).
**        DATA ls_bp_addr_response TYPE /dmo/a_businesspartneraddress.
**
**        DATA(lo_create_request) = lo_proxy->create_resource_for_entity_set( 'A_BUSINESSPARTNERADDRESS' )->create_request_for_create( ).
**        lo_create_request->set_business_data( ls_bp_addr ).
**        lo_create_request->execute( )->get_business_data( IMPORTING es_business_data = ls_bp_addr_response ).
*
***       try to use deep insert -> does not work
**        DATA(lo_create_request2) = lo_proxy->create_resource_for_entity_set( 'A_BUSINESSPARTNER'
**                 )->navigate_with_key( value ts_key_data( businesspartner = ls_bp_response-businesspartner )
**                 )->navigate_to_many( '_BUSINESSPARTNERADDRESS'
**                 )->create_request_for_create( ).
**        lo_create_request2->set_business_data( is_business_data = ls_bp_addr ).
**        lo_create_request2->execute( ). "->get_business_data( IMPORTING es_business_data = ls_bp_addr_response ).
*
*        rv_s4bpid = ls_bp_response-businesspartner.
*
*        lo_web_client->close( ).
*
*      CATCH cx_web_http_client_error
*            /iwbep/cx_gateway
*            INTO DATA(lx_exc).
*        RAISE EXCEPTION TYPE /dmo/cx_sc3_bp MESSAGE e006(/dmo/sc3) WITH 'S/4HANA Cloud system' ##NO_TEXT
*           EXPORTING
*             previous = lx_exc.
*    ENDTRY.

  ENDMETHOD.


  METHOD get_bp_json.
    DATA: ls_s4_bp TYPE ts_s4_bp.

    DATA(lt_json_mapping) = VALUE /ui2/cl_json=>name_mappings(
                                     (  abap = 'ORGANIZATION_NAME'  json = 'OrganizationBPName1' )
                                     (  abap = 'BUSINESS_PARTNER_CATEGORY'  json = 'BusinessPartnerCategory' )
                                     (  abap = 'BUSINESS_PARTNER_ADDRESS'  json = 'to_BusinessPartnerAddress' )
                                     (  abap = 'COUNTRY'  json = 'Country' )
                                     (  abap = 'STREET_NAME'  json = 'StreetName' )
                                     (  abap = 'POSTAL_CODE'  json = 'PostalCode' )
                                     (  abap = 'CITY_NAME'  json = 'CityName' ) ).

    " Map input to S/4 Business Partner structure
    ls_s4_bp = VALUE #(
                " Hardcoded, because 2 equals Company
                business_partner_category = '2'
                organization_name = is_business_partner-name
                business_partner_address = VALUE ts_s4_bp_address(
                    country = is_business_partner-countrycode
                    postal_code = is_business_partner-postcode
                    city_name = is_business_partner-city
                    street_name = |{ is_business_partner-road } { is_business_partner-housenumber }|
                ) ).

    rv_json = /ui2/cl_json=>serialize(
                data             = ls_s4_bp
                name_mappings = lt_json_mapping
              ).

    REPLACE ALL OCCURRENCES OF '"}}' IN rv_json WITH '"}]}' .
    REPLACE ALL OCCURRENCES OF '":{"' IN rv_json WITH '":[{"' .
  ENDMETHOD.


  METHOD get_bp_service_client.
    IF go_web_client IS INITIAL.

      " get client for destination
      TRY.
          DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination(
                                   i_name                  = gc_destination
                                   i_service_instance_name = gc_srv_instance_name
                                   i_authn_mode            = if_a4c_cp_service=>service_specific
                                 ).
          go_web_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

          go_web_client->accept_cookies( i_allow = abap_true ).
          "go_web_client->get_http_request( )->set_uri_path( gc_service_base_path ).
        CATCH cx_http_dest_provider_error
              cx_web_http_client_error
             INTO DATA(lx_exc).
          RAISE EXCEPTION TYPE /dmo/cx_sc3_bp MESSAGE e011(/dmo/sc3) WITH gc_destination gc_srv_instance_name
             EXPORTING
               previous = lx_exc.
      ENDTRY.

    ENDIF.

    " set URI for Odata service access
    DATA(lv_uri_path) = gc_service_base_path && '/A_BusinessPartner' && iv_uri_parameter.
    TRY.
        go_web_client->get_http_request( )->set_uri_path( lv_uri_path ).
      CATCH  cx_web_message_error INTO lx_exc.
        DATA lv_msg TYPE c LENGTH 200.
        lv_msg = lv_uri_path.
        RAISE EXCEPTION TYPE /dmo/cx_sc3_bp MESSAGE e010(/dmo/sc3) WITH lv_msg(50) lv_msg+50(50) lv_msg+100(50) lv_msg+150(50)
           EXPORTING
             previous = lx_exc.
    ENDTRY.

    ro_client = go_web_client.
  ENDMETHOD.
ENDCLASS.
