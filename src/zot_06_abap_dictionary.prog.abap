*&---------------------------------------------------------------------*
*& Report zot_06_abap_dictionary
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_06_abap_dictionary.

*TYPES: BEGIN OF lty_personel,
*       id TYPE zot_06_e_id,
*       ad TYPE zot_06_e_ad,
*       yas TYPE zot_06_e_yas,
*       departman TYPE zot_06_e_departman,
*       title TYPE zot_06_e_title,
*       END OF lty_personel.

*       DATA: ls_personel_1 TYPE lty_personel,
*             ls_personel_1 TYPE zor_06_s_personel.

DATA: ls_personel TYPE zot_06_s_personel,
      lt_personel TYPE TABLE OF zot_06_s_personel,
      lt_personel2 TYPE zot_06_tt_personel,
      lt_personel3 TYPE TABLE OF zot_06_tt_personel.

      break oteunal.
