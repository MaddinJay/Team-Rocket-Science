CLASS ycl_zw_notes_list DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: yif_zw_notes_list.
    METHODS constructor.

  PRIVATE SECTION.
    DATA mt_notes TYPE yif_zw_note=>tt_notes.
    DATA mo_note_dao TYPE REF TO yif_zw_note_dao.


ENDCLASS.


CLASS ycl_zw_notes_list IMPLEMENTATION.

  METHOD constructor.
    mo_note_dao = NEW ycl_zw_note_dao( ).
    mt_notes = mo_note_dao->read_notes( ).
  ENDMETHOD.

  METHOD yif_zw_notes_list~get_notes.
    rt_notes = mt_notes.
  ENDMETHOD.

  METHOD yif_zw_notes_list~get_relations.
    rt_relations = VALUE #( (  uuid = '100000000000' node = 'ROOT' father = '' )
                            (  uuid = '200000000000' node = 'Folder' father = '100000000000' )
                            (  uuid = '300000000000' node = 'Note'   father = '200000000000' ) ).
  ENDMETHOD.

  METHOD yif_zw_notes_list~get_note.
    LOOP AT mt_notes INTO DATA(lo_note).
      IF lo_note->get_uuid( ) = iv_uuid.
        ro_note = lo_note.
        RETURN.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
