CLASS ycl_zw_gui_controller DEFINITION PUBLIC CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES yif_zw_gui_controller.

    METHODS constructor.

  PRIVATE SECTION.
    DATA mo_views_facade TYPE REF TO yif_zw_views_facade.
    DATA mo_notes        TYPE REF TO yif_zw_notes_list.

    METHODS create_notes.
    METHODS create_views_facade.

ENDCLASS.

CLASS ycl_zw_gui_controller IMPLEMENTATION.

  METHOD constructor.
    create_notes( ).
    create_views_facade( ).
  ENDMETHOD.

  METHOD yif_zw_gui_controller~create_notes_tree_view.
    mo_views_facade->create_tree_view( mo_notes ).
  ENDMETHOD.

  METHOD create_notes.
    mo_notes = NEW ycl_zw_notes_list( ).
    mo_notes->create_notes( ).
  ENDMETHOD.

  METHOD create_views_facade.
    mo_views_facade = NEW ycl_zw_views_facade( ).
  ENDMETHOD.

  METHOD yif_zw_gui_controller~save_note_informations.
    mo_views_facade->update_processed_note( ).
    mo_notes->update_note( ).
  ENDMETHOD.

ENDCLASS.
