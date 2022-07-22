CLASS ycl_zw_get_notes DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: yif_zw_get_notes.

  PRIVATE SECTION.
ENDCLASS.


CLASS ycl_zw_get_notes IMPLEMENTATION.

  METHOD yif_zw_get_notes~get_notes.
    DATA lo_note TYPE REF TO yif_zw_note.
    lo_note = NEW ycl_zw_note( '1' ).
    lo_note->set_title( iv_title = 'Root' ).

    lo_note = NEW ycl_zw_note( '2' ).
    lo_note->set_title( iv_title = 'Folder' ).
    APPEND lo_note TO rt_notes.

    lo_note = NEW ycl_zw_note( '3' ).
    lo_note->set_title( iv_title = 'Note' ).
    APPEND lo_note TO rt_notes.
  ENDMETHOD.

  METHOD yif_zw_get_notes~get_relations.
    rt_relations = VALUE #( (  uuid = '1' node = 'ROOT' father = '' )
                            (  uuid = '2' node = 'Folder' father = 'ROOT' )
                            (  uuid = '3' node = 'Note'   father = 'Folder' ) ).
  ENDMETHOD.

ENDCLASS.
