CLASS lcl_handler DEFINITION INHERITING FROM cl_abap_behavior_handler FINAL.

  PUBLIC SECTION.

  PRIVATE SECTION.
    " name of a BEHAVIOR method must be "MODIFY | READ | LOCK
    METHODS modify FOR BEHAVIOR IMPORTING
                                  persist_bp_in_s4 FOR ACTION businesspartner~persist_bp_in_s4
                                                       RESULT persisted_bp_in_s4                                   .

ENDCLASS.

CLASS lcl_buffer DEFINITION.

  PUBLIC SECTION.

    TYPES: BEGIN OF ts_persist_bp_in_s4,
             id TYPE /dmo/sc3bpid,
           END OF ts_persist_bp_in_s4,
           tt_persist_bp_in_s4 TYPE STANDARD TABLE OF ts_persist_bp_in_s4 WITH DEFAULT KEY.

    CLASS-METHODS get_instance RETURNING VALUE(ro_instance) TYPE REF TO lcl_buffer.
    METHODS: set_persist_bp_in_s4 IMPORTING it_persist_bp_in_s4 TYPE tt_persist_bp_in_s4.
    METHODS: get_persist_bp_in_s4 RETURNING VALUE(rt_persist_bp_in_s4) TYPE tt_persist_bp_in_s4.

  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA: go_instance TYPE REF TO lcl_buffer.
    DATA: mt_persist_bp_in_s4 TYPE tt_persist_bp_in_s4.

ENDCLASS.

CLASS lcl_saver DEFINITION INHERITING FROM cl_abap_behavior_saver FINAL.
  PROTECTED SECTION.
    METHODS finalize          REDEFINITION.
    METHODS check_before_save REDEFINITION.
    METHODS save              REDEFINITION.
  PRIVATE SECTION.
    DATA mt_bp_for_save TYPE STANDARD TABLE OF /dmo/tsc3bp.
ENDCLASS.

CLASS lcl_handler IMPLEMENTATION.

  METHOD modify.

    IF persist_bp_in_s4 IS NOT INITIAL.

      DATA lt_persist_bp_in_s4 TYPE lcl_buffer=>tt_persist_bp_in_s4.
      DATA ls_persist_bp_in_s4 LIKE LINE OF lt_persist_bp_in_s4.
      LOOP AT persist_bp_in_s4 REFERENCE INTO DATA(lr_persist_bp_in_s4).
        CLEAR ls_persist_bp_in_s4.
        ls_persist_bp_in_s4-id = lr_persist_bp_in_s4->id.
        INSERT ls_persist_bp_in_s4 INTO TABLE lt_persist_bp_in_s4.
      ENDLOOP.
      lcl_buffer=>get_instance( )->set_persist_bp_in_s4( lt_persist_bp_in_s4 ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.

CLASS lcl_buffer IMPLEMENTATION.

  METHOD get_instance.
    IF go_instance IS NOT BOUND.
      go_instance = NEW #( ).
    ENDIF.
    ro_instance = go_instance.
  ENDMETHOD.

  METHOD set_persist_bp_in_s4.
    mt_persist_bp_in_s4 = it_persist_bp_in_s4.
  ENDMETHOD.

  METHOD get_persist_bp_in_s4.
    rt_persist_bp_in_s4 = mt_persist_bp_in_s4.
  ENDMETHOD.

ENDCLASS.

CLASS lcl_saver IMPLEMENTATION.
  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
    DATA(lt_persist_bp_in_s4) = lcl_buffer=>get_instance( )->get_persist_bp_in_s4( ).
    DATA lo_s4_handler   TYPE REF TO /dmo/cl_sc3_s4_handler.
    DATA lv_exist_s4bpid TYPE /dmo/sc3s4bpid.
    DATA ls_bp_for_save  LIKE LINE OF mt_bp_for_save.

    " actions
    IF lt_persist_bp_in_s4 IS NOT INITIAL.

      LOOP AT lt_persist_bp_in_s4 REFERENCE INTO DATA(lr_bp).
        CHECK lr_bp->id IS NOT INITIAL.
        TRY.
            "read details for selected OSM partner
            /dmo/cl_sc3_osm_handler=>get_businesspartner_by_id( EXPORTING iv_id              = lr_bp->id
                                                                IMPORTING es_businesspartner = DATA(ls_businesspartner) ).

            IF ls_businesspartner-s4bpid IS INITIAL.

              " register OSM partner as S/4 business partner
              lo_s4_handler = NEW /dmo/cl_sc3_s4_handler( ).
              DATA(lv_s4bpid) = lo_s4_handler->create_business_partner( is_businesspartner = ls_businesspartner ).

              "prepare for SAVE in local persistence
              ls_bp_for_save-id     = lr_bp->id.
              ls_bp_for_save-s4bpid = lv_s4bpid.
              INSERT ls_bp_for_save INTO TABLE mt_bp_for_save.

            ELSE.
              " check that same bp is registered
              SELECT SINGLE s4bpid FROM /dmo/tsc3bp WHERE id = @lr_bp->id INTO @lv_exist_s4bpid.
              IF sy-subrc = 0 AND lv_exist_s4bpid <> ls_businesspartner-s4bpid.
                RAISE EXCEPTION TYPE /dmo/cx_sc3_bp MESSAGE e008(/dmo/sc3) WITH lv_exist_s4bpid lr_bp->id.
              ELSE.
                "business partner already registered
                INSERT VALUE #( id       = lr_bp->id
                                %msg     = new_message( severity = ms-information id = '/DMO/SC3' number = '009' )
                                %element = VALUE #( id = lr_bp->id ) ) INTO TABLE reported-businesspartner.
              ENDIF.
            ENDIF.
          CATCH /dmo/cx_sc3_bp INTO DATA(lx_exc).
            DATA lx_root TYPE REF TO cx_root.
            lx_root = lx_exc.
            WHILE lx_root IS BOUND.
              INSERT VALUE #( id       = lr_bp->id
                              %msg     = new_message_with_text( severity = ms-error text = lx_root->get_text( ) )
                              %element = VALUE #( id = lr_bp->id ) ) INTO TABLE reported-businesspartner.
              lx_root = lx_root->previous.
            ENDWHILE.
            INSERT VALUE #( id = lr_bp->id %fail = VALUE #( cause = mc-unspecific ) ) INTO TABLE failed-businesspartner.
        ENDTRY.
      ENDLOOP.
    ENDIF.
  ENDMETHOD.

  METHOD save.
    " register business partner in local system
    LOOP AT mt_bp_for_save INTO DATA(ls_bp_for_save).
      INSERT /dmo/tsc3bp FROM @ls_bp_for_save.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
