*&---------------------------------------------------------------------*
*& Report zot_06_p_twitter
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_06_p_twitter.

SELECTION-SCREEN BEGIN OF BLOCK b1
    WITH FRAME TITLE TEXT-001.

    PARAMETERS: p_id TYPE zot_06_e_t_id,
                p_tweet TYPE zot_06_e_t_twt.

    DATA: lv_messg TYPE string,
        lt_06_t_twitter TYPE TABLE OF zot_06_t_tweet.

SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2
    WITH FRAME TITLE TEXT-002.

    PARAMETERS: p_tw_at   RADIOBUTTON GROUP g1,
                p_tw_sil  RADIOBUTTON GROUP g1,
                p_tw_deg  RADIOBUTTON GROUP g1,
                p_tw_ac   RADIOBUTTON GROUP g1.

SELECTION-SCREEN END OF BLOCK b2.




START-OF-SELECTION.


  CASE 'X'.
    WHEN p_tw_at.

        DATA gs_addrow TYPE zot_06_t_tweet.

        gs_addrow-tweet_id   = p_id.
        gs_addrow-tweet_text = p_tweet.

        SELECT SINGLE tweet_text
        FROM zot_06_t_tweet
        INTO @lv_messg
        WHERE tweet_id = @p_id.


        IF sy-subrc ne 0.
            INSERT zot_06_t_tweet
            FROM gs_addrow.
        ENDIF.


    WHEN p_tw_sil.

        SELECT SINGLE tweet_text
        FROM zot_06_t_tweet
        INTO @lv_messg
        WHERE tweet_id = @p_id.

        IF sy-subrc = 0.
            DELETE FROM zot_06_t_tweet WHERE tweet_id = p_id.

        ENDIF.


    WHEN p_tw_deg.



        SELECT SINGLE tweet_text
        FROM zot_06_t_tweet
        INTO @lv_messg
        WHERE tweet_id = @p_id.

        IF sy-subrc = 0.
            UPDATE zot_06_t_tweet SET tweet_text = p_tweet
            WHERE tweet_id EQ p_id.

        ENDIF.
ENDCASE.
