CLASS /dmo/cx_sc3_bp DEFINITION
  PUBLIC
  INHERITING FROM cx_dynamic_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_dyn_msg .
    INTERFACES if_t100_message .

    METHODS constructor
      IMPORTING
        !textid   LIKE if_t100_message=>t100key OPTIONAL
        !previous LIKE previous OPTIONAL .

    CLASS-METHODS create_from_system_message RETURNING VALUE(rcx) TYPE REF TO /dmo/cx_sc3_bp.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS /DMO/CX_SC3_BP IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous.
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
  ENDMETHOD.


  METHOD create_from_system_message.

    TRY.
        RAISE EXCEPTION TYPE /dmo/cx_sc3_bp USING MESSAGE.
      CATCH /dmo/cx_sc3_bp INTO rcx ##no_handler.
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
