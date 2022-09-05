CLASS lcl_tree_application IMPLEMENTATION.

  METHOD constructor.
    mo_notes_list = io_notes_list.
  ENDMETHOD.

  METHOD handle_node_double_click.
    mo_note_view = NEW ycl_zw_note_view( ).
    mo_note_view->create( mo_notes_list->get_note( CONV #( node_key ) ) ).
  ENDMETHOD.

ENDCLASS.
