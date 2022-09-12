CLASS ycl_zw_note_dao DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES yif_zw_note_dao.

ENDCLASS.

CLASS ycl_zw_note_dao IMPLEMENTATION.

  METHOD yif_zw_note_dao~read_notes.
    SELECT * FROM yzw_t_notes INTO TABLE @rt_notes.
    IF sy-subrc <> 0.
      " Nothing to do -> Notes View empty
    ENDIF.
  ENDMETHOD.

ENDCLASS.
