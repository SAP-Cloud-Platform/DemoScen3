"! <h1>Deletion of a Local Business Partner</h1>
"!
"! An existing local business partner will be deleted from the db.
"!
"! @parameter iv_bpid      | Business Partner ID to be deleted
"! @raising /dmo/cx_sc3_bp | Generic Application Exception
FUNCTION /DMO/LOCAL_BUPA_DELETE.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_BPID) TYPE  /DMO/SC3BPID
*"  RAISING
*"      /DMO/CX_SC3_BP
*"----------------------------------------------------------------------
  DELETE FROM /dmo/tsc3bp WHERE id = @iv_bpid.

  CASE sy-subrc.
    WHEN 0.
      EXIT.
    WHEN 4.
      RAISE EXCEPTION TYPE /dmo/cx_sc3_bp MESSAGE e000(/dmo/sc3) WITH |Business Partner not found.|.
    WHEN OTHERS.
      RAISE EXCEPTION TYPE /dmo/cx_sc3_bp MESSAGE e000(/dmo/sc3) WITH |Failed to delete Business Partner: rc { sy-subrc }.|.
  ENDCASE.

ENDFUNCTION.
