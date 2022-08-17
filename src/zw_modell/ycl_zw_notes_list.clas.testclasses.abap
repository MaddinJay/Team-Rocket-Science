CLASS ltcl_notes_list DEFINITION DEFERRED.
CLASS ycl_zw_notes_list DEFINITION LOCAL FRIENDS ltcl_notes_list.

CLASS ltcl_notes_list DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA mo_cut TYPE REF TO yif_zw_notes_list.
    DATA mo_notes_dao TYPE REF TO yif_zw_note_dao.

    METHODS:
      building_notes_ok FOR TESTING,
      building_relations_ok FOR TESTING,
      setup.
ENDCLASS.


CLASS ltcl_notes_list IMPLEMENTATION.

  METHOD setup.
    mo_notes_dao ?= cl_abap_testdouble=>create( 'yif_zw_note_dao' ).
    cl_abap_testdouble=>configure_call( mo_notes_dao )->returning( VALUE yzw_tt_notes(
                                                            ( uuid = '10000000000000000000000000000000' title = 'ROOT' )
                                                            ( uuid = '20000000000000000000000000000000' title = 'Folder' father = '10000000000000000000000000000000' )
                                                            ( uuid = '30000000000000000000000000000000' title = 'Note'   father = '20000000000000000000000000000000' ) ) ).
    mo_notes_dao->read_notes( ).

    mo_cut = NEW ycl_zw_notes_list( mo_notes_dao ).
  ENDMETHOD.

  METHOD building_notes_ok.
    DATA(lo_note) = mo_cut->get_note( '10000000000000000000000000000000' ).
    cl_abap_unit_assert=>assert_equals( exp = '10000000000000000000000000000000'
                                        act = lo_note->get_uuid( ) ).
  ENDMETHOD.

  METHOD building_relations_ok.
    cl_abap_unit_assert=>assert_equals(  exp = VALUE yzw_tt_relations(
                                                        (  uuid = '10000000000000000000000000000000' node = 'ROOT'   father = '000000000000' )
                                                        (  uuid = '20000000000000000000000000000000' node = 'Folder' father = '10000000000000000000000000000000' )
                                                        (  uuid = '30000000000000000000000000000000' node = 'Note'   father = '20000000000000000000000000000000' ) )
                                         act = mo_cut->get_relations( ) ).
  ENDMETHOD.

ENDCLASS.
