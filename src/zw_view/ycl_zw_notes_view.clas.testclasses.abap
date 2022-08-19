CLASS ltcl_notes_tree DEFINITION DEFERRED.
CLASS ycl_zw_notes_view DEFINITION LOCAL FRIENDS ltcl_notes_tree.

CLASS ltcl_notes_tree DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA mo_cut TYPE REF TO ycl_zw_notes_view.
    DATA mo_notes TYPE REF TO yif_zw_notes_list.

    METHODS:
      setup,
      create_mock_notes RETURNING VALUE(rt_notes) TYPE yif_zw_note_types=>tt_notes,

      "! Test if node list is build correctly
      buildingtree_nodes FOR TESTING,
      "! Determine the root node of the list correctly
      determine_root_node FOR TESTING.

ENDCLASS.


CLASS ltcl_notes_tree IMPLEMENTATION.

  METHOD setup.
    DATA lt_notes TYPE yif_zw_note_types=>tt_notes.

    mo_notes ?= cl_abap_testdouble=>create( 'yif_zw_notes_list' ).

    lt_notes = create_mock_notes( ).
    cl_abap_testdouble=>configure_call( mo_notes )->returning( lt_notes ).
    mo_notes->get_notes( ).

    mo_cut = NEW #( mo_notes ).
  ENDMETHOD.

  METHOD create_mock_notes.

    DATA(lo_note) = NEW ycl_zw_note( '123400000000' ).
    lo_note->yif_zw_note~set_title( 'ZW' ).
    lo_note->yif_zw_note~set_father( '000000000000' ).
    APPEND lo_note TO rt_notes.

    lo_note = NEW ycl_zw_note( '123500000000' ).
    lo_note->yif_zw_note~set_title( 'Node1' ).
    lo_note->yif_zw_note~set_father( '123400000000' ).
    APPEND lo_note TO rt_notes.

    lo_note = NEW ycl_zw_note( '123600000000' ).
    lo_note->yif_zw_note~set_title( 'Node2' ).
    lo_note->yif_zw_note~set_father( '123400000000' ).
    APPEND lo_note TO rt_notes.

    lo_note = NEW ycl_zw_note( '123700000000' ).
    lo_note->yif_zw_note~set_title( 'Node3' ).
    lo_note->yif_zw_note~set_father( '123600000000' ).
    APPEND lo_note TO rt_notes.

  ENDMETHOD.

  METHOD buildingtree_nodes.
    cl_abap_unit_assert=>assert_equals( exp = VALUE yif_zw_view_types=>tt_tree_nodes( ( node_key = '123400000000' text = 'ZW'    isfolder = 'X' relatkey = '000000000000' )
                                                                                      ( node_key = '123500000000' text = 'Node1' isfolder = ''  relatkey = '123400000000' relatship = cl_gui_simple_tree=>relat_last_child )
                                                                                      ( node_key = '123600000000' text = 'Node2' isfolder = 'X' relatkey = '123400000000' relatship = cl_gui_simple_tree=>relat_last_child )
                                                                                      ( node_key = '123700000000' text = 'Node3' isfolder = ''  relatkey = '123600000000' relatship = cl_gui_simple_tree=>relat_last_child )
                                                                                    )
                                        act = mo_cut->build_tree_nodes( ) ).
  ENDMETHOD.

  METHOD determine_root_node.
    cl_abap_unit_assert=>assert_equals( exp = '123400000000'
                                        act = mo_cut->get_root_node( ) ).
  ENDMETHOD.

ENDCLASS.
