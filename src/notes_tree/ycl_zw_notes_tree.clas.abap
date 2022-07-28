CLASS ycl_zw_notes_tree DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES yif_zw_notes_tree .

    METHODS constructor
      IMPORTING
        !io_controller TYPE REF TO yif_zw_get_notes .
  PROTECTED SECTION.
  PRIVATE SECTION.
    TYPES: tt_tree_nodes TYPE STANDARD TABLE OF node_str WITH DEFAULT KEY.

    CONSTANTS mc_tree_container         TYPE char14 VALUE 'TREE_CONTAINER' ##NO_TEXT.
    CONSTANTS mc_column_title           TYPE string VALUE 'Zettelchen' ##NO_TEXT.
    CONSTANTS mc_column_width           TYPE i VALUE 30.
    CONSTANTS mc_hierarchy_column_name  TYPE tv_itmname VALUE 'Notes' ##NO_TEXT.
    CONSTANTS mc_item_tab_structure TYPE x030l-tabname VALUE 'MTREEITM' ##NO_TEXT.

    DATA mo_gui_column_tree  TYPE REF TO cl_gui_simple_tree.
    DATA mo_nodes TYPE REF TO yif_zw_get_notes.
    DATA mt_tree_nodes TYPE tt_tree_nodes.
    DATA mt_fieldcatalog TYPE lvc_t_fcat.      "Output-Tabl

    METHODS create_initial_gui_column_tree.
    METHODS build_hierarchy_header RETURNING VALUE(rs_hierarchy_header) TYPE treev_hhdr.
    METHODS build_costum_container RETURNING VALUE(ro_custom_container) TYPE REF TO cl_gui_custom_container.



    METHODS build_fieldcatalog.
    METHODS build_tree_nodes       RETURNING VALUE(rt_nodes) TYPE tt_tree_nodes.
    METHODS is_folder              IMPORTING iv_node             TYPE yif_zw_note=>ty_uuid
                                             it_relations        TYPE yif_zw_get_notes=>tt_relations
                                   RETURNING VALUE(rv_is_folder) TYPE abap_bool.
ENDCLASS.

CLASS ycl_zw_notes_tree IMPLEMENTATION.

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

  METHOD build_hierarchy_header.
    rs_hierarchy_header = VALUE #( heading = mc_column_title
                                   width   = mc_column_width ).
  ENDMETHOD.

  METHOD build_tree_nodes.
    DATA(lt_relations) = mo_nodes->get_relations( ).
    DATA(lt_notes)     = mo_nodes->get_notes( ).

    rt_nodes = VALUE #( FOR <relation> IN lt_relations:
                        ( node_key = <relation>-uuid
                          text     = <relation>-node
                          isfolder = is_folder( iv_node = <relation>-uuid it_relations = lt_relations )
                          relatkey = <relation>-father ) ).
  ENDMETHOD.

  METHOD constructor.
    mo_nodes = io_controller.
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

  METHOD yif_zw_notes_tree~create_tree.
    create_initial_gui_column_tree( ).
  ENDMETHOD.

  METHOD is_folder.
    READ TABLE it_relations WITH KEY father = iv_node TRANSPORTING NO FIELDS.
    rv_is_folder = COND #( WHEN sy-subrc = 0 THEN abap_true ).
  ENDMETHOD.

ENDCLASS.
