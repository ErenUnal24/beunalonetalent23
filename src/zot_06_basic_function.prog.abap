*&---------------------------------------------------------------------*
*& Report zot_06_basic_function
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_06_basic_function.

DATA: lv_number1 TYPE i VALUE 10,
      lv_number2 TYPE i VALUE 5,
      lv_op      TYPE c VALUE '+',
      lv_result  TYPE i.

CALL FUNCTION 'ZOT_06_DO_MATH_OPS'
  EXPORTING
    iv_number1   =  lv_number1
    iv_number2   =  lv_number2
    iv_operation =  lv_op
  IMPORTING
    ev_result    = lv_result.

    cl_demo_output=>write( |{ lv_number1 } + { lv_number2 } = { lv_result }| ).

    cl_demo_output=>display(  ).
*CATCH cx_sy_zerodivide.
*CATCH cx_sy_assign_cast_error.
