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

    DATA mo_gui_column_tree  TYPE REF TO cl_gui_alv_tree.
    DATA mo_controller TYPE REF TO yif_zw_gui_controller.
    DATA mt_tree_data TYPE STANDARD TABLE OF sflight WITH DEFAULT KEY.
    DATA mt_fieldcatalog TYPE lvc_t_fcat.      "Output-Tabl

    METHODS create_initial_gui_column_tree.
    METHODS build_hierarchy_header RETURNING VALUE(rs_hierarchy_header) TYPE treev_hhdr.
    METHODS build_costum_container RETURNING VALUE(ro_custom_container) TYPE REF TO cl_gui_custom_container.
    METHODS add_nodes_and_items    IMPORTING io_notes TYPE REF TO yif_zw_get_notes.
    METHODS build_node_table        IMPORTING io_notes        TYPE REF TO yif_zw_get_notes
                                    RETURNING VALUE(rt_nodes) TYPE treev_ntab.
    METHODS build_item_table     IMPORTING io_notes        TYPE REF TO yif_zw_get_notes
                                 RETURNING VALUE(rt_items) TYPE yif_zw_notes_tree=>tt_items.
    METHODS build_fieldcatalog.
ENDCLASS.

CLASS ycl_zw_notes_tree IMPLEMENTATION.

  METHOD yif_zw_notes_tree~create_tree.
    create_initial_gui_column_tree( ).
    add_nodes_and_items( io_notes ).
  ENDMETHOD.

  METHOD create_initial_gui_column_tree.
    mo_gui_column_tree = NEW #(
        parent                      = build_costum_container( )
        node_selection_mode         = cl_gui_column_tree=>node_sel_mode_single
        item_selection              = abap_true
        no_html_header              = abap_true
        no_toolbar                  = abap_false ).

    build_fieldcatalog( ).
    DATA: ls_variant TYPE disvariant.
    ls_variant-report = sy-repid.

* create emty tree-control
    CALL METHOD mo_gui_column_tree->set_table_for_first_display
      EXPORTING
        is_hierarchy_header = build_hierarchy_header( )
        i_background_id     = 'ALV_BACKGROUND'
        i_save              = 'A'
        is_variant          = ls_variant
      CHANGING
        it_outtab           = mt_tree_data
        it_fieldcatalog     = mt_fieldcatalog.
  ENDMETHOD.

  METHOD build_hierarchy_header.
    rs_hierarchy_header = VALUE #( heading = mc_column_title
                                   width   = mc_column_width ).
  ENDMETHOD.

  METHOD build_costum_container.
    ro_custom_container = NEW #( container_name = mc_tree_container ).
  ENDMETHOD.

  METHOD add_nodes_and_items.
    mo_gui_column_tree->add_node(
      EXPORTING
        i_relat_node_key     = ''                 " Node Already in Tree Hierarchy
        i_relationship       = cl_gui_column_tree=>relat_last_child                 " How to Insert Node
*        is_outtab_line       =                  " Attributes of Inserted Node
*        is_node_layout       =                  " Node Layout
*        it_item_layout       =                  " Item Layout
        i_node_text          = 'Root'                 " Hierarchy Node Text
*      IMPORTING
*        e_new_node_key       =                  " Key of New Node Key
*      EXCEPTIONS
*        relat_node_not_found = 1                " Relat Node Key not Found
*        node_not_found       = 2                " Node not Found
*        others               = 3
    ).
    IF sy-subrc <> 0.
*     MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
*       WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.
  ENDMETHOD.

  METHOD build_node_table.
    DATA(lt_relations) = io_notes->get_relations( ).
    DATA(lt_notes)     = io_notes->get_notes( ).

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


  METHOD build_fieldcatalog.
    CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
      EXPORTING
        i_structure_name = 'YTREE_NODES'
      CHANGING
        ct_fieldcat      = mt_fieldcatalog.

  ENDMETHOD.

ENDCLASS.
