INTERFACE /dmo/if_dummy
  PUBLIC .

  METHODS dummy
    IMPORTING iv_a          TYPE i
              iv_b          TYPE i
    RETURNING VALUE(rv_sum) TYPE i.

ENDINTERFACE.
