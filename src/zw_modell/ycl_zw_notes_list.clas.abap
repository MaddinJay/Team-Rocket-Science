CLASS ycl_zw_notes_list DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES: yif_zw_notes_list.

    METHODS constructor IMPORTING io_notes_dao TYPE REF TO yif_zw_note_dao OPTIONAL.

  PRIVATE SECTION.
    DATA mt_notes TYPE yif_zw_note_types=>tt_notes.
    DATA mo_note_dao TYPE REF TO yif_zw_note_dao.

    METHODS build_notes_list IMPORTING it_notes TYPE yzw_tt_notes.
    METHODS update_notes_list.

ENDCLASS.

CLASS ycl_zw_notes_list IMPLEMENTATION.

  METHOD constructor.
    mo_note_dao = COND #( WHEN io_notes_dao IS BOUND THEN io_notes_dao
                          ELSE NEW ycl_zw_note_dao( ) ).
  ENDMETHOD.

  METHOD yif_zw_notes_list~get_notes.
    rt_notes = mt_notes.
  ENDMETHOD.

  METHOD yif_zw_notes_list~get_note.
    LOOP AT mt_notes INTO DATA(lo_note).
      IF lo_note->get_uuid( ) = iv_uuid.
        ro_note = lo_note.
        RETURN.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD yif_zw_notes_list~create_notes.
    DATA(lt_notes) = mo_note_dao->read_notes( ).
    build_notes_list( lt_notes ).
  ENDMETHOD.

  METHOD build_notes_list.
    DATA lo_note TYPE REF TO yif_zw_note.

    LOOP AT it_notes INTO DATA(ls_note).
      lo_note = NEW ycl_zw_note( ls_note ).
      APPEND lo_note TO mt_notes.
    ENDLOOP.
  ENDMETHOD.

  METHOD yif_zw_notes_list~update_note.
    update_notes_list( ).
  ENDMETHOD.

  METHOD update_notes_list.
    DATA(lt_notes) = VALUE yzw_tt_notes( FOR <note> IN mt_notes:
                                           ( uuid   = <note>->get_uuid( )
                                             title  = <note>->get_title( )
                                             body   = <note>->get_body( )
                                             father = <note>->get_father( ) ) ).
    mo_note_dao->update_notes( lt_notes ).
  ENDMETHOD.

ENDCLASS.
