CLASS /dmo/cl_sc3_bp_query_prov DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_a4c_rap_query_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS /DMO/CL_SC3_BP_QUERY_PROV IMPLEMENTATION.


  METHOD if_a4c_rap_query_provider~select.

*   ensure: in case of a single record is requested (e.g. data for a detail page),
*           only one record is returned and SET_TOTAL_NUMBER_OF_RECORDS = 1

    DATA lt_businesspartner     TYPE /dmo/cl_sc3_osm_handler=>tt_businesspartner.
    DATA lt_tmp_businesspartner TYPE /dmo/cl_sc3_osm_handler=>tt_businesspartner.
    DATA lv_total_count         TYPE int8.

    IF io_request->is_data_requested( ).

      TRY.

          DATA(ls_paging)      = io_request->get_paging( ).
          DATA(lt_filter_cond) = io_request->get_filter_conditions( ).
          DATA(lt_fields)      = io_request->get_requested_elements( ).
          DATA(lt_sort)        = io_request->get_sort_elements( ).

          DATA lv_details_read TYPE abap_bool.

          READ TABLE lt_filter_cond WITH KEY element = 'ID' INTO DATA(ls_id_filter).
          IF sy-subrc = 0 AND lines( ls_id_filter-option ) = 1.
            READ TABLE ls_id_filter-option INTO DATA(ls_id_option) INDEX 1.
            IF sy-subrc = 0 AND ls_id_option-sign = 'I' AND ls_id_option-option = 'EQ' AND ls_id_option-low IS NOT INITIAL.
              "read details for single record in list
              /dmo/cl_sc3_osm_handler=>get_businesspartner_by_id( EXPORTING iv_id = CONV #( ls_id_option-low )
                                                                  IMPORTING es_businesspartner = DATA(ls_businesspartner) ).
              APPEND ls_businesspartner TO lt_businesspartner.
              lv_details_read = abap_true.
            ENDIF.
          ENDIF.

          IF lv_details_read = abap_false.
            "read data according to the FILTER Criteria

            "search for cities
            IF lt_filter_cond IS NOT INITIAL.
              LOOP AT lt_filter_cond REFERENCE INTO DATA(lr_filter_cond) WHERE element = 'CITY'.
                LOOP AT lr_filter_cond->option REFERENCE INTO DATA(lr_option).
                  IF lr_option->sign = 'I' AND lr_option->option = 'EQ'.
                    CHECK lr_option->low IS NOT INITIAL.
                    /dmo/cl_sc3_osm_handler=>search_for_businesspartner( EXPORTING  iv_city            = lr_option->low
                                                                                    is_paging          = ls_paging
                                                                          IMPORTING et_businesspartner = lt_tmp_businesspartner
                                                                                    ev_total_count     = DATA(lv_tmp_total_count) ).
                    "adjust paging
                    ls_paging-maximum_rows = ls_paging-maximum_rows - lines( lt_tmp_businesspartner ).
                    APPEND LINES OF lt_tmp_businesspartner TO lt_businesspartner.
                    lv_total_count = lv_total_count + lv_tmp_total_count.
                  ELSE.
                    RAISE EXCEPTION TYPE /dmo/cx_sc3_bp MESSAGE e013(/dmo/sc3) WITH 'CITY'.
                  ENDIF.
                ENDLOOP.
              ENDLOOP.
            ELSE.
              "no search
            ENDIF.
          ENDIF.

          "return business partner(s)
          io_response->set_data( lt_businesspartner ).

        CATCH /dmo/cx_sc3_bp INTO DATA(lx_exc).
          RAISE EXCEPTION TYPE cx_a4c_rap_query_provider
            EXPORTING
              previous = lx_exc.
      ENDTRY.


    ENDIF.

    IF io_request->is_total_rec_number_requested( ).
      IF lv_total_count IS INITIAL.
        lv_total_count = LINES( lt_businesspartner ).
      ENDIF.
      io_response->set_total_number_of_records( lv_total_count ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
