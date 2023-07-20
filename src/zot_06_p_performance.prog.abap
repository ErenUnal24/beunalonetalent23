*&---------------------------------------------------------------------*
*& Report zot_06_p_performance
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_06_p_performance.


* SELECT * Kullanımı

SELECT * FROM sflight
INTO TABLE @DATA(lt_sflight_all).

SELECT CARRID,
       CONNID,
       FLDATE,
       PRICE
       FROM sflight
       INTO TABLE @DATA(lt_sflight).


SELECT CARRID,
       CONNID,
       FLDATE,
       PRICE
       FROM sflight
       INTO TABLE @DATA(lt_sflight2).

       BREAK-POINT.
