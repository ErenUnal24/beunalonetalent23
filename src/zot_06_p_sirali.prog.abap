*&---------------------------------------------------------------------*
*& Report zot_06_p_sirali
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_06_p_sirali.

DATA:
   gv_num1  TYPE i VALUE 0,
   gv_count TYPE i.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE t.
   PARAMETERS: gv_maks TYPE i,
               gv_brk  TYPE n.

   WHILE gv_num1 < gv_maks.
      gv_num1 += 1.

      IF gv_num1 > gv_maks.
          EXIT.
      ENDIF.
          WRITE gv_num1.
      gv_count += 1.
      IF gv_count MOD gv_brk = 0.
          WRITE /.
      ENDIF.
   ENDWHILE.

SELECTION-SCREEN END OF BLOCK b1.
