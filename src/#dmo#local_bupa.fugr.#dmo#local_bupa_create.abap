"! <h1>Creation of a Local Business Partner</h1>
"!
"! A given OSM party might be persisted, despite it exists, already.
"!
"! @parameter is_businesspartner | Business Partner to be persisted
"! @raising /dmo/cx_sc3_bp       | Generic Application Exception
FUNCTION /DMO/LOCAL_BUPA_CREATE.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IS_BUSINESSPARTNER) TYPE  /DMO/TSC3BP
*"  RAISING
*"      /DMO/CX_SC3_BP
*"----------------------------------------------------------------------
  INSERT /dmo/tsc3bp FROM @is_businesspartner.

  CASE sy-subrc.
    WHEN 0.
      EXIT.
    WHEN 4.
      RAISE EXCEPTION TYPE /dmo/cx_sc3_bp MESSAGE e000(/dmo/sc3) WITH |Business Partner exists already.|.
    WHEN OTHERS.
      RAISE EXCEPTION TYPE /dmo/cx_sc3_bp MESSAGE e000(/dmo/sc3) WITH |Failed to insert Business Partner: rc { sy-subrc }.|.
  ENDCASE.

ENDFUNCTION.
