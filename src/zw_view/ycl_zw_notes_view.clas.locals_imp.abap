CLASS lcl_tree_application IMPLEMENTATION.

  METHOD handle_node_double_click.
    " this method handles the node double click event of the tree
    " model instance

    " show the key of the double clicked node in a dynpro field
*    g_event = 'NODE_DOUBLE_CLICK'.
*    g_node_key = node_key

    CALL FUNCTION 'POPUP_TO_INFORM'
      EXPORTING
        titel = 'Selected Note'                " Title line of dialog box
        txt1  = node_key
        txt2  = ''.
  ENDMETHOD.

ENDCLASS.
