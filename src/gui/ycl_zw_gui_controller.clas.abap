CLASS ycl_zw_gui_controller DEFINITION PUBLIC CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: yif_zw_gui_controller.
    METHODS constructor.


  PRIVATE SECTION.
    DATA mo_tree_view TYPE REF TO yif_zw_notes_tree.

ENDCLASS.

CLASS ycl_zw_gui_controller IMPLEMENTATION.

  METHOD constructor.
    mo_tree_view = NEW ycl_zw_notes_tree( ).
  ENDMETHOD.

  METHOD yif_zw_gui_controller~create_notes_tree.
    mo_tree_view->create_tree( ).
  ENDMETHOD.

  METHOD yif_zw_gui_controller~get_relations.

  ENDMETHOD.

ENDCLASS.
