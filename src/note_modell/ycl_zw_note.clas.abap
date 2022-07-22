CLASS ycl_zw_note DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES yif_zw_note.

    METHODS constructor IMPORTING iv_uuid     TYPE yif_note_dao=>ty_uuid
                                  io_note_dao TYPE REF TO yif_note_dao OPTIONAL.

  PRIVATE SECTION.
    DATA mv_uuid TYPE yif_note_dao=>ty_uuid.
    DATA mo_note_dao TYPE REF TO yif_note_dao.
    DATA mv_title TYPE yif_note_dao=>ty_title.

    METHODS set_uuid IMPORTING iv_uuid TYPE yif_note_dao=>ty_uuid.
    METHODS set_note_dao IMPORTING io_note_dao TYPE REF TO yif_note_dao.

ENDCLASS.

CLASS ycl_zw_note IMPLEMENTATION.

  METHOD constructor.
    set_uuid( iv_uuid ).
    set_note_dao( io_note_dao ).
  ENDMETHOD.

  METHOD set_note_dao.
    mo_note_dao = COND #( WHEN io_note_dao IS BOUND THEN io_note_dao
                          ELSE NEW ycl_note_dao( ) ).
  ENDMETHOD.

  METHOD set_uuid.
    mv_uuid = iv_uuid.
  ENDMETHOD.

  METHOD yif_zw_note~get_body.
    rv_body = mo_note_dao->get_body( ).
  ENDMETHOD.

  METHOD yif_zw_note~get_title.
    rv_title = mv_title.
  ENDMETHOD.

  METHOD yif_zw_note~get_uuid.
    rv_uuid = mv_uuid.
  ENDMETHOD.

  METHOD yif_zw_note~set_title.
    mv_title = iv_title.
  ENDMETHOD.

  METHOD yif_zw_note~set_uuid.
    mv_uuid = iv_uuid.
  ENDMETHOD.

ENDCLASS.
