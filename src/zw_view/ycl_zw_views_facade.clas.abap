CLASS ycl_zw_views_facade DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES yif_zw_views_facade.

  PRIVATE SECTION.
    DATA mo_tree_view TYPE REF TO yif_zw_notes_view.
    DATA mo_note_view TYPE REF TO yif_zw_note_view.

ENDCLASS.

CLASS ycl_zw_views_facade IMPLEMENTATION.

  METHOD yif_zw_views_facade~create_tree_view.
    mo_tree_view = NEW ycl_zw_tree_view( io_notes        = io_notes
                                         io_views_facade = me ).
    mo_tree_view->create( ).
  ENDMETHOD.

  METHOD yif_zw_views_facade~create_note_view.
    mo_note_view = NEW ycl_zw_note_view( ).
    mo_note_view->create( io_note ).
  ENDMETHOD.

ENDCLASS.
