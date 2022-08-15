CLASS ycl_zw_notes_view DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES yif_zw_notes_view .

    METHODS constructor IMPORTING io_controller TYPE REF TO yif_zw_notes_list .

  PRIVATE SECTION.
    TYPES: tt_tree_nodes TYPE STANDARD TABLE OF node_str WITH DEFAULT KEY.

    CONSTANTS mc_tree_container      TYPE char14 VALUE 'TREE_CONTAINER' ##NO_TEXT.
    CONSTANTS mc_tree_node_strcuture TYPE x030l-tabname VALUE 'NODE_STR'.

    DATA mo_gui_tree     TYPE REF TO cl_gui_simple_tree.
    DATA mo_nodes        TYPE REF TO yif_zw_notes_list.
    DATA mo_application  TYPE REF TO lcl_tree_application.
    DATA mt_tree_nodes   TYPE tt_tree_nodes.
    DATA mt_fieldcatalog TYPE lvc_t_fcat.

    METHODS create_initial_gui_column_tree.
    METHODS build_costum_container RETURNING VALUE(ro_custom_container) TYPE REF TO cl_gui_custom_container.
    METHODS build_tree_nodes       RETURNING VALUE(rt_nodes) TYPE tt_tree_nodes.
    METHODS is_folder              IMPORTING iv_node             TYPE yif_zw_note=>ty_uuid
                                             it_relations        TYPE yif_zw_notes_list=>tt_relations
                                   RETURNING VALUE(rv_is_folder) TYPE abap_bool.
    METHODS determine_relationship IMPORTING iv_father          TYPE tv_nodekey
                                   RETURNING VALUE(rv_is_child) TYPE int4.
    METHODS add_nodes.
    METHODS get_root_node          RETURNING VALUE(rv_root_node) TYPE tv_nodekey.
    METHODS expand_node.
    METHODS add_event_handler.
    METHODS create_event_double_click
      RETURNING
        VALUE(rs_event) TYPE cntl_simple_event.

ENDCLASS.

CLASS ycl_zw_notes_view IMPLEMENTATION.

  METHOD constructor.
    mo_nodes = io_controller.
  ENDMETHOD.

  METHOD yif_zw_notes_view~create.
    create_initial_gui_column_tree( ).
    add_event_handler( ).
    add_nodes( ).
    expand_node( ).
  ENDMETHOD.

  METHOD build_costum_container.
    ro_custom_container = NEW #( container_name = mc_tree_container ).
  ENDMETHOD.

  METHOD build_tree_nodes.
    DATA(lt_relations) = mo_nodes->get_relations( ).
    DATA(lt_notes)     = mo_nodes->get_notes( ).

    rt_nodes = VALUE #( FOR <relation> IN lt_relations:
                        ( node_key = <relation>-uuid
                          text     = <relation>-node
                          isfolder = is_folder( iv_node = <relation>-uuid it_relations = lt_relations )
                          relatkey = <relation>-father
                          relatship = determine_relationship( <relation>-father ) ) ).
  ENDMETHOD.

  METHOD create_initial_gui_column_tree.
    CREATE OBJECT mo_gui_tree
      EXPORTING
        parent              = build_costum_container( )
        node_selection_mode = mo_gui_tree->node_sel_mode_single.
  ENDMETHOD.

  METHOD expand_node.
    mo_gui_tree->expand_node( get_root_node( ) ).
  ENDMETHOD.

  METHOD is_folder.
    READ TABLE it_relations WITH KEY father = iv_node TRANSPORTING NO FIELDS.
    rv_is_folder = COND #( WHEN sy-subrc = 0 THEN abap_true ).
  ENDMETHOD.

  METHOD determine_relationship.
    rv_is_child = COND #( WHEN iv_father IS NOT INITIAL THEN cl_gui_simple_tree=>relat_last_child ).
  ENDMETHOD.

  METHOD add_nodes.
    mo_gui_tree->add_nodes(
        node_table           = build_tree_nodes( )
        table_structure_name = mc_tree_node_strcuture ).
  ENDMETHOD.

  METHOD get_root_node.
    DATA(lt_relations) = mo_nodes->get_relations( ).
    rv_root_node = lt_relations[ father = '' ]-uuid.
  ENDMETHOD.


  METHOD add_event_handler.
    DATA lt_events TYPE cntl_simple_events.

    APPEND create_event_double_click( ) TO lt_events.

    mo_gui_tree->set_registered_events( events = lt_events ).
    ##TODO " Exception abfangen

    mo_application = NEW #( mo_nodes ).
    SET HANDLER mo_application->handle_node_double_click FOR mo_gui_tree.
  ENDMETHOD.


  METHOD create_event_double_click.
    rs_event = VALUE cntl_simple_event( eventid    = cl_gui_simple_tree=>eventid_node_double_click
                                        appl_event = abap_true ).
  ENDMETHOD.

ENDCLASS.
