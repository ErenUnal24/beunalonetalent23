*&---------------------------------------------------------------------*
*& Report zot_06_p_asal
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_06_p_asal.

DATA: gv_count TYPE i VALUE 1.


   SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE t.
   PARAMETERS: gv_1 TYPE i,
               gv_2 TYPE i.


   WHILE gv_1 < gv_2.


      while gv_1 MOD gv_count = 0.

        gv_count = gv_count + 1.


     ENDWHILE.
      WRITE gv_1.
        gv_1 = gv_1 + 1.

   ENDWHILE.

 SELECTION-SCREEN END OF BLOCK b1.
