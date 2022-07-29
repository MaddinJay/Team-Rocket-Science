CLASS ycl_zw_gui_controller DEFINITION PUBLIC CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: yif_zw_gui_controller.

    METHODS constructor.

  PRIVATE SECTION.
    DATA mo_view TYPE REF TO yif_zw_notes_view.
    DATA mo_notes TYPE REF TO ycl_zw_notes_list.

ENDCLASS.

CLASS ycl_zw_gui_controller IMPLEMENTATION.

  METHOD constructor.
    mo_notes = NEW ycl_zw_notes_list( ).
    mo_view  = NEW ycl_zw_notes_view( mo_notes ).
  ENDMETHOD.

  METHOD yif_zw_gui_controller~create_notes_view.
    mo_view->create( mo_notes ).
  ENDMETHOD.

ENDCLASS.
