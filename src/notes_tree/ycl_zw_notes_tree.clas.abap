CLASS ycl_zw_notes_tree DEFINITION PUBLIC CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: yif_zw_notes_tree.

    METHODS: constrcutor IMPORTING io_controller TYPE REF TO ycl_zw_gui_controller.

  PRIVATE SECTION.
    CONSTANTS mc_tree_container         TYPE char14 VALUE 'TREE_CONTAINER' ##NO_TEXT.
    CONSTANTS mc_column_title           TYPE string VALUE 'Zettelchen' ##NO_TEXT.
    CONSTANTS mc_column_width           TYPE i VALUE 30.
    CONSTANTS mc_hierarchy_column_name  TYPE tv_itmname VALUE 'Notes' ##NO_TEXT.
    CONSTANTS mc_item_tab_structure TYPE x030l-tabname VALUE 'MTREEITM' ##NO_TEXT.

    DATA mo_gui_column_tree  TYPE REF TO cl_gui_column_tree.
    DATA mo_controller TYPE REF TO yif_zw_gui_controller.

    METHODS create_initial_gui_column_tree.
    METHODS build_hierarchy_header RETURNING VALUE(rs_hierarchy_header) TYPE treev_hhdr.
    METHODS build_costum_container RETURNING VALUE(ro_custom_container) TYPE REF TO cl_gui_custom_container.
    METHODS add_nodes_and_items.
    METHODS build_node_table
      RETURNING
        VALUE(rt_nodes) TYPE treev_ntab.
    METHODS build_item_table
      RETURNING
        VALUE(rt_items) TYPE yif_zw_notes_tree=>tt_items.
ENDCLASS.

CLASS ycl_zw_notes_tree IMPLEMENTATION.

  METHOD yif_zw_notes_tree~create_tree.
    create_initial_gui_column_tree( ).
    add_nodes_and_items( ).
  ENDMETHOD.

  METHOD create_initial_gui_column_tree.
    mo_gui_column_tree = NEW #(
        parent                      = build_costum_container( )
        node_selection_mode         = cl_gui_column_tree=>node_sel_mode_single
        item_selection              = abap_true
        hierarchy_column_name       = mc_hierarchy_column_name
        hierarchy_header            = build_hierarchy_header( ) ).
  ENDMETHOD.

  METHOD build_hierarchy_header.
    rs_hierarchy_header = VALUE #( heading = mc_column_title
                                   width   = mc_column_width ).
  ENDMETHOD.

  METHOD build_costum_container.
    ro_custom_container = NEW #( container_name = mc_tree_container ).
  ENDMETHOD.

  METHOD add_nodes_and_items.
    mo_gui_column_tree->add_nodes_and_items(
      EXPORTING
        node_table                     = build_node_table( )
        item_table                     = build_item_table( )
        item_table_structure_name      = mc_item_tab_structure ).
  ENDMETHOD.

  METHOD build_node_table.
    DATA(lt_relations) = mo_controller->get_relations( ).
    DATA(lt_notes)     = mo_controller->get_notes( ).

    DATA: ls_node TYPE treev_node.

    ls_node-node_key = 'ROOT'.
    " Key of the node
    CLEAR ls_node-relatkey.      " Special case: A root node has no parent
    CLEAR ls_node-relatship.     " node.

    ls_node-hidden = ' '.        " The node is visible,
    ls_node-disabled = ' '.      " selectable,
    ls_node-isfolder = ''.      " a folder.
    CLEAR ls_node-n_image.       " Folder-/ Leaf-Symbol in state "closed":
    " use default.
    CLEAR ls_node-exp_image.     " Folder-/ Leaf-Symbol in state "open":
    " use default
    CLEAR ls_node-expander.      " see below.
    APPEND ls_node TO rt_nodes.
  ENDMETHOD.

  METHOD build_item_table.

  ENDMETHOD.

  METHOD constrcutor.
    mo_controller = io_controller.
  ENDMETHOD.

ENDCLASS.
