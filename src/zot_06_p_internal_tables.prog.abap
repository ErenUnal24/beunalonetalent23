*&---------------------------------------------------------------------*
*& Report zot_06_p_internal_tables
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_06_p_internal_tables.



*TYPES: BEGIN OF lty_material,
*         matnr TYPE matnr,
*         maktx TYPE maktx,
*         matkl TYPE matkl,
*         menge TYPE menge_d,
*         meins TYPE meins,
*       END OF lty_material.

DATA: lt_material TYPE TABLE OF zot_00_t_materia,
      ls_material TYPE zot_00_t_materia.

SELECT * FROM zot_00_t_materia INTO TABLE lt_material.

DATA gt_material_s TYPE SORTED TABLE OF zot_00_t_materia WITH UNIQUE KEY matkl.
*ls_material-matnr =       '01'.
*ls_material-maktx =    'Çekiç'.
*ls_material-matkl = 'Hırdavat'.
*ls_material-menge =          5.
*ls_material-meins =       'PC'.
*
*APPEND ls_material TO lt_material.
**INSERT ls_material INTO TABLE lt_material.
*lt_material = VALUE #( BASE lt_material ( matnr =        '02'
*                                          maktx = 'Tornavida'
*                                          matkl =  'Hırdavat'
*                                          menge =        '10'
*                                          meins =        'PC' ) ).
*ls_material-matnr =       '03'.
*ls_material-maktx =   'Lastik'.
*ls_material-matkl = 'Hırdavat'.
*ls_material-menge =         15.
*ls_material-meins =       'PC'.
*INSERT ls_material INTO TABLE lt_material.




*DATA: lt_material_s TYPE SORTED TABLE OF zot_00_t_materia



gt_material_s = VALUE #( BASE gt_material_s  (

matnr = 01
maktx = 'Dolmakalem'
matkl = 'C'
menge = 13
meins = 'ST'
)
( matnr = 02
maktx = 'Mekanik Kalem'
matkl = 'C'
menge = 65
meins = 'ST'
)
( matnr = 03
maktx = 'Eskiz Kalemi'
matkl = 'C'
menge = 33
meins = 'ST'
)
( matnr = 04
maktx = 'Kurşun Kalem'
matkl = 'C'
menge = 89
meins = 'ST'
)
(  matnr = 05
maktx = 'Cam Kalem'
matkl = 'C'
menge = 4
meins = 'ST'
) ).

cl_demo_output=>display( gt_material_s ).



LOOP AT lt_material INTO DATA(gs_materia).
  READ TABLE gt_material_s INTO DATA(gs_material_c)
  WITH KEY meins = gs_materia-meins.

  IF sy-subrc EQ 0.
    MODIFY lt_material FROM gs_materia.
    gs_materia-menge += 10.

  ENDIF.
ENDLOOP.

DATA: lt_materia_join TYPE TABLE OF zot_00_t_materia.
