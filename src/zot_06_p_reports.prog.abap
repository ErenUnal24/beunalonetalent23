*&---------------------------------------------------------------------*
*& Report zot_06_p_reports
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_06_p_reports.

tables: eban, ekpo.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-001.

SELECT-OPTIONS : s_sat_no for eban-banfn,
                 s_b_tur for eban-bnfpo.

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE text-002.

SELECT-OPTIONS : s_sas_no for ekpo-ebeln,
                 s_sb_tur for ekpo-ebelp.

SELECTION-SCREEN end OF BLOCK b2.

PARAMETERS: r_rad1 RADIOBUTTON GROUP g1,
            r_rad2 RADIOBUTTON GROUP g1.

START-OF-SELECTION.

    IF r_rad1 = abap_true.

        SELECT banfn,
               bnfpo,
               matkl,
               matnr,
               menge,
               meins

        FROM eban INTO TABLE @DATA(lt_eban) WHERE banfn IN @s_sas_no AND bnfpo IN @s_sb_tur.

        SORT lt_eban BY banfn ASCENDING.

    ELSEIF r_rad2 = abap_true.

        SELECT ebeln,
               ebelp,
               matkl,
               matnr,
               menge,
               meins

        FROM ekpo INTO TABLE @DATA(lt_ekpo) WHERE ebelp IN @s_sas_no AND matkl IN @s_sb_tur.


        ENDIF.

        START-OF-SELECTION.

         IF r_rad1 EQ abap_true.
    DATA(lt_sat) = VALUE slis_t_fieldcat_alv( ( fieldname = 'MATNR'
                                                seltext_m = 'Malzeme NO' )
                                            (   fieldname = 'MENGE'
                                                seltext_m = 'SAT Miktar' )
                                            (   fieldname = 'MEINS'
                                                seltext_m = 'Ölçü Miktar' )
                                            (   fieldname = 'BANFN'
                                                seltext_m = 'SAT NO' )
                                            (   fieldname = 'BNFPO'
                                                seltext_m = 'SAT Kalem NO' )
                                             ).
    CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
      EXPORTING
        i_callback_program = sy-repid
        it_fieldcat        = lt_sat
      TABLES
        t_outtab           = lt_eban.


  ELSEIF r_rad2 EQ abap_true.

    DATA(lt_sas) = VALUE slis_t_fieldcat_alv( ( fieldname = 'MATNR'
                                                seltext_m = 'Malzeme NO' )
                                             (  fieldname = 'MENGE'
                                                seltext_m = 'SAT Miktar' )
                                             (  fieldname = 'MEINS'
                                                seltext_m = 'Ölçü Miktar' )
                                              ( fieldname = 'MATKL'
                                                seltext_m = 'Malzeme Grubu' )
                                             (  fieldname = 'EBELN'
                                                seltext_m = 'Satın Alma Belge NO' )
                                              ).

    CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
      EXPORTING
        i_callback_program = sy-repid
        it_fieldcat        = lt_sas
      TABLES
        t_outtab           = lt_ekpo.

  ENDIF.




END-OF-SELECTION.
