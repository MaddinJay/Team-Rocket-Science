CLASS ycl_zw_note DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES yif_zw_note.

    METHODS constructor IMPORTING iv_uuid     TYPE yif_note_dao=>ty_uuid
                                  io_note_dao TYPE REF TO yif_zw_note_dao OPTIONAL.

  PRIVATE SECTION.
    DATA mv_uuid TYPE yif_note_dao=>ty_uuid.
    DATA mo_note_dao TYPE REF TO yif_zw_note_dao.
    DATA mv_title TYPE yif_note_dao=>ty_title.
    DATA mv_body TYPE yif_note_dao=>ty_body.

    METHODS set_uuid IMPORTING iv_uuid TYPE yif_note_dao=>ty_uuid.

ENDCLASS.

CLASS ycl_zw_note IMPLEMENTATION.

  METHOD constructor.
    set_uuid( iv_uuid ).
  ENDMETHOD.

  METHOD set_uuid.
    mv_uuid = iv_uuid.
  ENDMETHOD.

  METHOD yif_zw_note~get_body.
    rv_body = mv_body.
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

  METHOD yif_zw_note~set_body.
    mv_body = iv_body.
  ENDMETHOD.

ENDCLASS.
