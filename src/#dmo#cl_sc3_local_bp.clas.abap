CLASS /dmo/cl_sc3_local_bp DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS /dmo/cl_sc3_local_bp IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.
    SELECT * FROM /dmo/tsc3bp INTO TABLE @DATA(lt_bupa).
    CALL TRANSFORMATION /dmo/trsc3locbpser SOURCE business_partners = lt_bupa RESULT XML DATA(xml).
    response->set_binary( xml ).
    response->set_header_field( i_name = if_web_http_header=>content_type i_value = if_web_http_header=>content_type_html_utf8 ).
    response->set_status( if_web_http_status=>ok ).
  ENDMETHOD.
ENDCLASS.
