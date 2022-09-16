CLASS ycx_zw_exception DEFINITION
  PUBLIC
  INHERITING FROM cx_no_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_dyn_msg .
    INTERFACES if_t100_message .

    METHODS constructor
      IMPORTING
        !textid    LIKE if_t100_message=>t100key OPTIONAL
        !previous  LIKE previous OPTIONAL
        iv_message TYPE string.
    METHODS get_message RETURNING VALUE(rv_message) TYPE string.

  PRIVATE SECTION.
    DATA mv_message TYPE string.

ENDCLASS.



CLASS YCX_ZW_EXCEPTION IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous.
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
    mv_message = iv_message.
  ENDMETHOD.


  METHOD get_message.
    rv_message = mv_message.
  ENDMETHOD.

ENDCLASS.
