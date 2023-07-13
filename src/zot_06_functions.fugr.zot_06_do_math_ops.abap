FUNCTION ZOT_06_DO_MATH_OPS.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_NUMBER1) TYPE  I
*"     VALUE(IV_NUMBER2) TYPE  I
*"     VALUE(IV_OPERATION) TYPE  I
*"  EXPORTING
*"     REFERENCE(EV_RESULT) TYPE  I
*"  RAISING
*"      CX_SY_ZERODIVIDE
*"     RESUMABLE(CX_SY_ASSIGN_CAST_ERROR)
*"----------------------------------------------------------------------

case iv_operation.
  when '+'.
    ev_result = iv_number1 + iv_number2.
  when '-'.
    ev_result = iv_number1 - iv_number2.
  when '*'.
    ev_result = iv_number1 * iv_number2.
  when '/'.
    ev_result = iv_number1 / iv_number2.
endcase.

ENDFUNCTION.
