CLASS ycl_zw_notes_tree DEFINITION PUBLIC CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: yif_zw_notes_tree.

    METHODS: constructor IMPORTING io_controller TYPE REF TO ycl_zw_gui_controller OPTIONAL.

  PRIVATE SECTION.
    TYPES: tt_tree_nodes TYPE STANDARD TABLE OF node_str WITH DEFAULT KEY.

    CONSTANTS mc_tree_container         TYPE char14 VALUE 'TREE_CONTAINER' ##NO_TEXT.
    CONSTANTS mc_column_title           TYPE string VALUE 'Zettelchen' ##NO_TEXT.
    CONSTANTS mc_column_width           TYPE i VALUE 30.
    CONSTANTS mc_hierarchy_column_name  TYPE tv_itmname VALUE 'Notes' ##NO_TEXT.
    CONSTANTS mc_item_tab_structure TYPE x030l-tabname VALUE 'MTREEITM' ##NO_TEXT.

    DATA mo_gui_column_tree  TYPE REF TO cl_gui_simple_tree.
    DATA mo_controller TYPE REF TO yif_zw_gui_controller.
    DATA mt_tree_nodes TYPE tt_tree_nodes.
    DATA mt_fieldcatalog TYPE lvc_t_fcat.      "Output-Tabl

    METHODS create_initial_gui_column_tree.
    METHODS build_hierarchy_header RETURNING VALUE(rs_hierarchy_header) TYPE treev_hhdr.
    METHODS build_costum_container RETURNING VALUE(ro_custom_container) TYPE REF TO cl_gui_custom_container.



    METHODS build_fieldcatalog.
    METHODS build_tree_nodes
      RETURNING
        VALUE(rt_nodes) TYPE tt_tree_nodes.
ENDCLASS.

CLASS ycl_zw_notes_tree IMPLEMENTATION.

  METHOD constructor.
*    mo_controller = io_controller.
  ENDMETHOD.

  METHOD yif_zw_notes_tree~create_tree.
    create_initial_gui_column_tree( ).
  ENDMETHOD.

  METHOD create_initial_gui_column_tree.
    CREATE OBJECT mo_gui_column_tree
      EXPORTING
        parent              = build_costum_container( )
        node_selection_mode = mo_gui_column_tree->node_sel_mode_single.

    CALL METHOD mo_gui_column_tree->add_nodes
      EXPORTING
        node_table           = build_tree_nodes( )
        table_structure_name = 'NODE_STR'.
  ENDMETHOD.

  METHOD build_hierarchy_header.
    rs_hierarchy_header = VALUE #( heading = mc_column_title
                                   width   = mc_column_width ).
  ENDMETHOD.

  METHOD build_costum_container.
    ro_custom_container = NEW #( container_name = mc_tree_container ).
  ENDMETHOD.

  METHOD build_fieldcatalog.
    CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
      EXPORTING
        i_structure_name = 'YTREE_NODES'
      CHANGING
        ct_fieldcat      = mt_fieldcatalog.

  ENDMETHOD.


  METHOD build_tree_nodes.
    rt_nodes = mt_tree_nodes = VALUE #( ).

    DATA: node TYPE node_str.

* node table of the left tree
    CLEAR node.
    ##NO_TEXT
    node-node_key = 'Root'.
    node-isfolder = 'X'.
    ##NO_TEXT
    node-text = 'Texte'.
    node-dragdropid = ' '.
    APPEND node TO rt_nodes.

    CLEAR node.
    ##NO_TEXT
    node-node_key = 'Child1'.
    ##NO_TEXT
    node-relatkey = 'Root'.
    node-relatship = cl_gui_simple_tree=>relat_last_child.
    ##NO_TEXT
    node-text = 'DragDrop Text 1'.
*  node-dragdropid = handle_tree.       " handle of behaviour
    APPEND node TO rt_nodes.

    CLEAR node.
    ##NO_TEXT
    node-node_key = 'Child2'.
    ##NO_TEXT
    node-relatkey = 'Root'.
    node-relatship = cl_gui_simple_tree=>relat_last_child.
    ##NO_TEXT
    node-text = 'DragDrop Text 2'.
*  node-dragdropid = handle_tree.       " handle of behaviour
    APPEND node TO rt_nodes.
  ENDMETHOD.

ENDCLASS.
