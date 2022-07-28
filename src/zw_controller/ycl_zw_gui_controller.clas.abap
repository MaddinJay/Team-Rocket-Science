CLASS ycl_zw_gui_controller DEFINITION PUBLIC CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: yif_zw_gui_controller.
    METHODS constructor.


  PRIVATE SECTION.
    DATA mo_tree_view TYPE REF TO yif_zw_notes_tree.
    DATA mo_notes TYPE REF TO ycl_zw_get_notes.

ENDCLASS.

CLASS ycl_zw_gui_controller IMPLEMENTATION.

  METHOD constructor.
    mo_notes     = NEW ycl_zw_get_notes( ).
    mo_tree_view = NEW ycl_zw_notes_tree( mo_notes ).
  ENDMETHOD.

  METHOD yif_zw_gui_controller~create_notes_tree.
    mo_tree_view->create_tree( mo_notes ).
  ENDMETHOD.

ENDCLASS.
