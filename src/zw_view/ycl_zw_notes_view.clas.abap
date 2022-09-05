CLASS ycl_zw_notes_view DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES yif_zw_notes_view .

    METHODS constructor IMPORTING io_controller TYPE REF TO yif_zw_notes_list .

  PRIVATE SECTION.
    CONSTANTS mc_tree_container      TYPE char14 VALUE 'TREE_CONTAINER' ##NO_TEXT.
    CONSTANTS mc_tree_node_strcuture TYPE x030l-tabname VALUE 'NODE_STR'.

    DATA mo_gui_tree     TYPE REF TO cl_gui_simple_tree.
    DATA mo_notes        TYPE REF TO yif_zw_notes_list.
    DATA mo_application  TYPE REF TO lcl_tree_application.
    DATA mt_notes        TYPE yif_zw_note_types=>tt_notes.

    METHODS create_initial_gui_column_tree.
    METHODS build_costum_container RETURNING VALUE(ro_custom_container) TYPE REF TO cl_gui_custom_container.
    METHODS build_tree_nodes       RETURNING VALUE(rt_nodes) TYPE yif_zw_view_types=>tt_tree_nodes.
    METHODS is_folder              IMPORTING iv_father           TYPE yif_zw_note_types=>ty_uuid
                                   RETURNING VALUE(rv_is_folder) TYPE abap_bool.
    METHODS determine_relationship IMPORTING iv_father          TYPE yif_zw_note_types=>ty_uuid
                                   RETURNING VALUE(rv_is_child) TYPE int4.
    METHODS add_nodes.
    METHODS get_root_node          RETURNING VALUE(rv_root_node) TYPE tv_nodekey.
    METHODS expand_node.
    METHODS add_event_handler.
    METHODS create_event_double_click RETURNING VALUE(rs_event) TYPE cntl_simple_event.
    METHODS set_notes.

ENDCLASS.



CLASS YCL_ZW_NOTES_VIEW IMPLEMENTATION.


  METHOD add_event_handler.
    DATA lt_events TYPE cntl_simple_events.

    APPEND create_event_double_click( ) TO lt_events.

    mo_gui_tree->set_registered_events( events = lt_events ).
    ##TODO " Exception abfangen

    mo_application = NEW #( mo_notes ).
    SET HANDLER mo_application->handle_node_double_click FOR mo_gui_tree.
  ENDMETHOD.


  METHOD add_nodes.
    mo_gui_tree->add_nodes(
        node_table           = build_tree_nodes( )
        table_structure_name = mc_tree_node_strcuture ).
  ENDMETHOD.


  METHOD build_costum_container.
    ro_custom_container = NEW #( container_name = mc_tree_container ).
  ENDMETHOD.


  METHOD build_tree_nodes.
    rt_nodes = VALUE #( FOR <note> IN mt_notes:
                        ( node_key  = <note>->get_uuid( )
                          text      = <note>->get_title( )
                          isfolder  = is_folder( <note>->get_uuid( ) )
                          relatkey  = <note>->get_father( )
                          relatship = determine_relationship( <note>->get_father( ) ) ) ).
  ENDMETHOD.


  METHOD constructor.
    mo_notes = io_controller.
    set_notes( ).
  ENDMETHOD.


  METHOD create_event_double_click.
    rs_event = VALUE cntl_simple_event( eventid    = cl_gui_simple_tree=>eventid_node_double_click
                                        appl_event = abap_true ).
  ENDMETHOD.


  METHOD create_initial_gui_column_tree.
    CREATE OBJECT mo_gui_tree
      EXPORTING
        parent              = build_costum_container( )
        node_selection_mode = mo_gui_tree->node_sel_mode_single.
  ENDMETHOD.


  METHOD determine_relationship.
    rv_is_child = COND #( WHEN iv_father IS NOT INITIAL THEN cl_gui_simple_tree=>relat_last_child ).
  ENDMETHOD.


  METHOD expand_node.
    mo_gui_tree->expand_node( get_root_node( ) ).
  ENDMETHOD.


  METHOD get_root_node.
    DATA(lt_notes) = mo_notes->get_notes( ).
    LOOP AT lt_notes INTO DATA(lo_note).
      IF lo_note->get_father( ) IS INITIAL.
        rv_root_node = lo_note->get_uuid( ).
        EXIT.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.


  METHOD is_folder.
    LOOP AT mt_notes INTO DATA(lo_note).
      IF lo_note->get_father( ) = iv_father.
        rv_is_folder = abap_true.
        RETURN.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.


  METHOD set_notes.
    mt_notes = mo_notes->get_notes( ).
  ENDMETHOD.


  METHOD yif_zw_notes_view~create.
    CHECK mo_gui_tree IS NOT BOUND.
    create_initial_gui_column_tree( ).
    add_event_handler( ).
    add_nodes( ).
    expand_node( ).
  ENDMETHOD.
ENDCLASS.
