CLASS lcl_tree_application IMPLEMENTATION.

  METHOD constructor.
    mo_notes_list = io_notes_list.
  ENDMETHOD.

  METHOD handle_node_double_click.

    DATA(lo_note) = mo_notes_list->get_note( CONV #( node_key ) ).
    CALL FUNCTION 'POPUP_TO_INFORM'
      EXPORTING
        titel = 'Selected Note'                " Title line of dialog box
        txt1  = lo_note->get_title( )
        txt2  = lo_note->get_body( ).
  ENDMETHOD.

ENDCLASS.
