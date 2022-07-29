CLASS ycl_zw_notes_list DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: yif_zw_notes_list.

  PRIVATE SECTION.
ENDCLASS.


CLASS ycl_zw_notes_list IMPLEMENTATION.

  METHOD yif_zw_notes_list~get_notes.
    DATA lo_note TYPE REF TO yif_zw_note.
    lo_note = NEW ycl_zw_note( '100000000000' ).
    lo_note->set_title( iv_title = 'Root' ).

    lo_note = NEW ycl_zw_note( '200000000000' ).
    lo_note->set_title( iv_title = 'Folder' ).
    APPEND lo_note TO rt_notes.

    lo_note = NEW ycl_zw_note( '300000000000' ).
    lo_note->set_title( iv_title = 'Note' ).
    APPEND lo_note TO rt_notes.
  ENDMETHOD.

  METHOD yif_zw_notes_list~get_relations.
    rt_relations = VALUE #( (  uuid = '100000000000' node = 'ROOT' father = '' )
                            (  uuid = '200000000000' node = 'Folder' father = '100000000000' )
                            (  uuid = '300000000000' node = 'Note'   father = '200000000000' ) ).
  ENDMETHOD.

ENDCLASS.
