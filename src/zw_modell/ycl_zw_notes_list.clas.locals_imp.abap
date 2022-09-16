CLASS ltd_note_dao DEFINITION.

  PUBLIC SECTION.
    INTERFACES yif_zw_note_dao.

ENDCLASS.

CLASS ltd_note_dao IMPLEMENTATION.

  METHOD yif_zw_note_dao~read_notes.
    rt_notes = VALUE yzw_tt_notes(
      ( uuid = '10000000000000000000000000000000' title = 'ROOT' )
      ( uuid = '20000000000000000000000000000000' title = 'Folder' father = '10000000000000000000000000000000' )
      ( uuid = '30000000000000000000000000000000' title = 'Note'   father = '20000000000000000000000000000000' ) ).
  ENDMETHOD.

  METHOD yif_zw_note_dao~update_notes.
    IF it_notes <> VALUE yzw_tt_notes(
      ( uuid = '10000000000000000000000000000000' title = 'ROOT' )
      ( uuid = '20000000000000000000000000000000' title = 'Folder' father = '10000000000000000000000000000000' )
      ( uuid = '30000000000000000000000000000000' title = 'Note'   father = '20000000000000000000000000000000' ) ).
      RAISE EXCEPTION TYPE ycx_zw_exception EXPORTING iv_message = 'Fehler im Update'.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
