CLASS lcl_tree_application DEFINITION.
  PUBLIC SECTION.

    METHODS:
      constructor IMPORTING io_notes_list TYPE REF TO yif_zw_notes_list,

      "! Handle Double Click on Tree Entry: Open Note in Subscreen if Double-Clicked
      "! @parameter node_key | Vom User selektierter Knoten
      handle_node_double_click FOR EVENT node_double_click OF cl_gui_simple_tree
        IMPORTING node_key.

  PRIVATE SECTION.
    DATA mo_notes_list TYPE REF TO yif_zw_notes_list.

ENDCLASS.
