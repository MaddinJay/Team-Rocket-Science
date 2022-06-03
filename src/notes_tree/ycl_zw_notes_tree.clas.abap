CLASS ycl_zw_notes_tree DEFINITION PUBLIC CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: yif_zw_notes_tree.

  PRIVATE SECTION.
    CONSTANTS mc_tree_container         TYPE char14 VALUE 'TREE_CONTAINER' ##NO_TEXT.
    CONSTANTS mc_column_title           TYPE string VALUE 'Zettelchen' ##NO_TEXT.
    CONSTANTS mc_column_width           TYPE i VALUE 30.
    CONSTANTS mc_hierarchy_column_name  TYPE tv_itmname VALUE 'Test' ##NO_TEXT.

    DATA mo_gui_column_tree  TYPE REF TO cl_gui_column_tree.

    METHODS create_gui_column_tree.
    METHODS build_hierarchy_header RETURNING VALUE(rs_hierarchy_header) TYPE treev_hhdr.
    METHODS build_costum_container RETURNING VALUE(ro_custom_container) TYPE REF TO cl_gui_custom_container.

ENDCLASS.

CLASS ycl_zw_notes_tree IMPLEMENTATION.

  METHOD yif_zw_notes_tree~create.
    create_gui_column_tree( ).
  ENDMETHOD.

  METHOD create_gui_column_tree.
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

ENDCLASS.
