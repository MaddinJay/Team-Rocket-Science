CLASS lcl_tree_application IMPLEMENTATION.

  METHOD constructor.
    mo_notes_list = io_notes_list.
    mo_view_facade = io_view_facade.
  ENDMETHOD.

  METHOD handle_node_double_click.
    mo_view_facade->create_note_view( mo_notes_list->get_note( CONV #( node_key ) ) ).
  ENDMETHOD.

ENDCLASS.
