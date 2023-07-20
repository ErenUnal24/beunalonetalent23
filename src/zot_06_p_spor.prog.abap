*&---------------------------------------------------------------------*
*& Report zot_06_p_spor
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_06_p_spor.

DATA: gv_random LIKE qf00-ran_int.

TYPES: BEGIN OF gty_sports,
         club_id        TYPE c LENGTH 10,
         club_name TYPE  c LENGTH 15,
         nation  TYPE c LENGTH 5,
         pot     TYPE c LENGTH 1,
       END OF gty_sports.

DATA: gs_sports TYPE gty_sports,
      gt_sports TYPE TABLE OF gty_sports.

TYPES : BEGIN OF gty_grup,
          club_name TYPE c LENGTH 15,
        END OF gty_grup.

DATA: gt_grup1 TYPE TABLE OF gty_grup,
      gt_grup2 TYPE TABLE OF gty_grup,
      gt_grup3 TYPE TABLE OF gty_grup,
      gt_grup4 TYPE TABLE OF gty_grup,
      gt_final TYPE TABLE OF gty_grup,
      gs_final TYPE gty_grup.

gt_sports = VALUE #( BASE gt_sports ( club_id   = 1
                                      club_name = 'Liverpool'
                                      nation    = 'EN'
                                      pot       = 1
                                      )
                                      ( club_id   = 2
                                        club_name = 'Bayern Münih'
                                        nation    = 'DE'
                                        pot       = 1
                                      )
                                      ( club_id   = 3
                                        club_name = 'Inter'
                                        nation    = 'IT'
                                        pot       = 1
                                      )
                                      ( club_id   = 4
                                        club_name = 'PSG'
                                        nation    = 'FR'
                                        pot       = 1
                                       )
                                      ( club_id   = 5
                                        club_name = 'Machester City'
                                        nation    = 'EN'
                                        pot       = 2
                                      )
                                      ( club_id   = 6
                                        club_name = 'PSV'
                                        nation    = 'NE'
                                        pot       = 2
                                      )
                                      ( club_id   = 7
                                        club_name = 'Porto'
                                        nation = 'PO'
                                        pot = 2
                                       )
                                      ( club_id   = 8
                                        club_name = 'Real Madrid'
                                        nation = 'ES'
                                        pot = 2
                                       )
                                      ( club_id   = 9
                                        club_name = 'Dortmund'
                                        nation    = 'DE'
                                        pot       = 3
                                       )
                                      ( club_id   = 10
                                        club_name = 'Beşiktaş'
                                        nation    = 'TR'
                                        pot       = 3
                                       )
                                      ( club_id   = 11
                                        club_name = 'Marsilya'
                                        nation    = 'FR'
                                        pot       = 3
                                       )
                                      ( club_id   = 12
                                        club_name = 'Ajax'
                                        nation    = 'NL'
                                        pot       = 3
                                       )
                                      ( club_id   = 13
                                        club_name = 'Aek'
                                        nation    = 'GR'
                                        pot       = 4
                                       )
                                      ( club_id   = 14
                                        club_name = 'Roma'
                                        nation    = 'IT'
                                        pot       = 4
                                       )
                                      ( club_id   = 15
                                        club_name = 'Stabükreş'
                                        nation    = 'RO'
                                        pot       = 4
                                       )
                                      ( club_id   = 16
                                        club_name = 'Atletico Madrid'
                                        nation    = 'ES'
                                        pot       = 4
                                       ) ).


*DATA(lv_count)  = 16.


*if lv_count > 0 .
*
*DATA:
* lv_ran_int       TYPE qf00-ran_int,
*lv_invalid_input TYPE TABLE OF qf00-ran_int.
*
*WHILE lines( gt_sports ) LT 4.
*
*CALL FUNCTION 'QF05_RANDOM_INTEGER'
*  EXPORTING
*    ran_int_max   = 16
*    ran_int_min   = 1
*  IMPORTING
*    ran_int       = lv_ran_int
*  EXCEPTIONS
*    invalid_input = 1.
*
*READ TABLE gt_sports INTO DATA(ls_sports) WITH KEY id = lv_ran_int.
*
*APPEND lv_ran_int TO lv_invalid_input.
*
*ENDWHILE.
**ENDIF.

 DATA(lv_count)  = 16.

LOOP AT gt_sports INTO DATA(ls_db).

    CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING
      ran_int_max   = lv_count - 1
      ran_int_min   = 1
    IMPORTING
      ran_int       = gv_random
    EXCEPTIONS
      invalid_input = 1
      OTHERS        = 2.

  READ TABLE gt_sports INTO DATA(ls_read) WITH KEY club_id = gv_random.
  IF sy-subrc = 0.

    IF ls_read-nation NE ls_db-nation.
      IF ls_read-pot NE ls_db-pot.
        if lines( gt_grup1 ) < 4.
        APPEND ls_read-club_name TO gt_grup1.
        DELETE gt_sports WHERE club_id  = ls_read-club_id.
       endif.
      ENDIF.
    ENDIF.
  ENDIF.
ENDLOOP.


LOOP AT gt_sports INTO DATA(ls_db2).

    CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING
      ran_int_max   = lv_count - 1
      ran_int_min   = 1
    IMPORTING
      ran_int       = gv_random
    EXCEPTIONS
      invalid_input = 1
      OTHERS        = 2.

  READ TABLE gt_sports INTO DATA(ls_read2) WITH KEY club_id = gv_random.
  IF sy-subrc = 0.
    if sy-index MOD 4 = 0.
      IF ls_read2-nation NE ls_db2-nation.
        IF ls_read2-pot NE ls_db2-pot.
          if lines( gt_grup2 ) < 4.
          APPEND ls_read2-club_name TO gt_grup2.
          DELETE gt_sports WHERE club_id  = ls_read2-club_id.
          endif.
        ENDIF.
      ENDIF.
    ENDIF.
  endif.
ENDLOOP.


LOOP AT gt_sports INTO DATA(ls_db3).

    CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING
      ran_int_max   = lv_count - 1
      ran_int_min   = 1
    IMPORTING
      ran_int       = gv_random
    EXCEPTIONS
      invalid_input = 1
      OTHERS        = 2.

  READ TABLE gt_sports INTO DATA(ls_read3) WITH KEY club_id = gv_random.
  IF sy-subrc = 0.
    if sy-index MOD 4 = 0.
      IF ls_read3-nation NE ls_db3-nation.
        IF ls_read3-pot NE ls_db3-pot.
          if lines( gt_grup3 ) < 4.
          APPEND ls_read3-club_name TO gt_grup3.
          DELETE gt_sports WHERE club_id  = ls_read3-club_id.
          endif.
        ENDIF.
      ENDIF.
    ENDIF.
  endif.
ENDLOOP.

LOOP AT gt_sports INTO DATA(ls_db4).

    CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING
      ran_int_max   = lv_count - 1
      ran_int_min   = 1
    IMPORTING
      ran_int       = gv_random
    EXCEPTIONS
      invalid_input = 1
      OTHERS        = 2.

  READ TABLE gt_sports INTO DATA(ls_read4) WITH KEY club_id = gv_random.
  IF sy-subrc = 0.
      if sy-index MOD 4 = 0.
        IF ls_read4-nation NE ls_db4-nation.
          IF ls_read4-pot NE ls_db4-pot.
            if lines( gt_grup4 ) < 4.
            APPEND ls_read4-club_name TO gt_grup4.
            DELETE gt_sports WHERE club_id  = ls_read4-club_id.
            endif.
          ENDIF.
        ENDIF.
      ENDIF.
    endif.
ENDLOOP.


cl_demo_output=>write( gt_grup1 ).
cl_demo_output=>write( gt_grup2 ).
cl_demo_output=>write( gt_grup3 ).
cl_demo_output=>write( gt_grup4 ).
cl_demo_output=>display(  ).
