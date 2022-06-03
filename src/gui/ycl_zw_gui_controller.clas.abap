CLASS ycl_zw_gui_controller DEFINITION PUBLIC CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: yif_zw_gui_controller.
    METHODS constructor.

  PRIVATE SECTION.
    DATA mo_tree TYPE REF TO yif_zw_notes_tree.

ENDCLASS.

CLASS ycl_zw_gui_controller IMPLEMENTATION.

  METHOD constructor.
    mo_tree = NEW ycl_zw_notes_tree( ).
  ENDMETHOD.

  METHOD yif_zw_gui_controller~create_notes_tree.
    mo_tree->create( ).
  ENDMETHOD.

ENDCLASS.
