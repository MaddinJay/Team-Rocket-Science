CLASS ltcl_notes_tree DEFINITION DEFERRED.
CLASS ycl_zw_notes_tree DEFINITION LOCAL FRIENDS ltcl_notes_tree.

CLASS ltcl_notes_tree DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA mo_cut TYPE REF TO ycl_zw_notes_tree.
    DATA mo_notes TYPE REF TO yif_zw_get_notes.

    METHODS:
      buildingtree_nodes FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltcl_notes_tree IMPLEMENTATION.

  METHOD buildingtree_nodes.
    mo_notes ?= cl_abap_testdouble=>create( 'yif_zw_get_notes' ).
    cl_abap_testdouble=>configure_call( mo_notes )->returning( VALUE yif_zw_get_notes=>tt_relations( ( uuid = '123400000000' node = 'ZW' father = '' )
                                                                                                     ( uuid = '123500000000' node = 'Node1' father = '123400000000' )
                                                                                                     ( uuid = '123600000000' node = 'Node2' father = '123400000000' )
                                                                                                     ( uuid = '123700000000' node = 'Node3' father = '123600000000' ) ) ).
    mo_notes->get_relations( ).

    cl_abap_testdouble=>configure_call( mo_notes )->returning( VALUE yif_zw_note=>tt_notes( ( NEW ycl_zw_note( '123400000000' ) )
                                                                                            ( NEW ycl_zw_note( '123500000000' ) )
                                                                                            ( NEW ycl_zw_note( '123600000000' ) )
                                                                                            ( NEW ycl_zw_note( '123700000000' ) ) ) ).
    mo_notes->get_notes( ).

    mo_cut = NEW #( mo_notes ).
    cl_abap_unit_assert=>assert_equals( exp = VALUE ycl_zw_notes_tree=>tt_tree_nodes( ( node_key = '123400000000' text = 'ZW'    isfolder = 'X' relatkey = '' )
                                                                                      ( node_key = '123500000000' text = 'Node1' isfolder = ''  relatkey = '123400000000' )
                                                                                      ( node_key = '123600000000' text = 'Node2' isfolder = 'X' relatkey = '123400000000' )
                                                                                      ( node_key = '123700000000' text = 'Node3' isfolder = ''  relatkey = '123600000000') )
                                        act = mo_cut->build_tree_nodes( ) ).
  ENDMETHOD.

ENDCLASS.
