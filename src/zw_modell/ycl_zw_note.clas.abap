CLASS ycl_zw_note DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES yif_zw_note.

    METHODS constructor IMPORTING is_note_informations TYPE yzw_t_notes
                                  io_note_dao          TYPE REF TO yif_zw_note_dao OPTIONAL.

  PRIVATE SECTION.
    DATA mo_note_dao TYPE REF TO yif_zw_note_dao.

    DATA mv_uuid   TYPE yif_zw_note_types=>ty_uuid.
    DATA mv_title  TYPE yif_zw_note_types=>ty_title.
    DATA mv_body   TYPE yif_zw_note_types=>ty_body.
    DATA mv_father TYPE yif_zw_note_types=>ty_uuid.

    METHODS set_uuid      IMPORTING iv_uuid TYPE yif_zw_note_types=>ty_uuid.
    METHODS set_title     IMPORTING iv_title      TYPE yif_zw_note_types=>ty_title.
    METHODS set_body      IMPORTING iv_body       TYPE yif_zw_note_types=>ty_body.
    METHODS set_father    IMPORTING iv_father     TYPE yif_zw_note_types=>ty_uuid.

ENDCLASS.

CLASS ycl_zw_note IMPLEMENTATION.

  METHOD constructor.
    set_uuid( is_note_informations-uuid ).
    set_title( is_note_informations-title ).
    set_body( is_note_informations-body ).
    set_father( is_note_informations-father ).
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

  METHOD set_title.
    mv_title = iv_title.
  ENDMETHOD.

  METHOD set_body.
    mv_body = iv_body.
  ENDMETHOD.

  METHOD yif_zw_note~get_father.
    rv_father = mv_father.
  ENDMETHOD.

  METHOD set_father.
    mv_father = iv_father.
  ENDMETHOD.

ENDCLASS.
