*&---------------------------------------------------------------------*
*& Report zot_06_p_open_sql
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_06_p_open_sql.



DATA gv_banfn TYPE eban-banfn.

DATA gs_eban TYPE eban.

DATA gt_eban TYPE TABLE OF eban.

START-OF-SELECTION.

*select single ilk bulduğunu alıyor
*SELECT SINGLE banfn
*FROM eban
*WHERE bsart EQ 'NB'
*INTO @gv_banfn.

*SELECT SINGLE loekz
*FROM eban
*WHERE banfn = '0010000023'
*AND bnfpo = '0020'
*INTO @loekz.

*WRITE: /gv_banfn


select single banfn, bnfpo
from eban
where banfn = '0010000023'
and   bnfpo = '0020'
*into corresponding fields of @gs_eban.
into @DATA(ls_eban).

if sy-subrc = 0.
*    write :/ gs_eban-banfn, gs_eban-bsart.
     cl_demo_output=>display( ls_eban ).
else.
    write :/ 'error'.
endif.
