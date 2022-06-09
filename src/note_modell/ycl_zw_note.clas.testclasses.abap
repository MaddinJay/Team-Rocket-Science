CLASS ltc_note DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA:
      mo_cut      TYPE REF TO yif_note,
      mo_note_dao TYPE REF TO yif_note_dao.
    METHODS:
      setup,
      get_uuid  FOR TESTING,
      get_title FOR TESTING,
      get_body FOR TESTING.
ENDCLASS.


CLASS ltc_note IMPLEMENTATION.

  METHOD setup.
    mo_note_dao ?= cl_abap_testdouble=>create( 'yif_note_dao' ).

    mo_cut = NEW ycl_zw_note( iv_uuid = '1234567890123456'
                           io_note_dao = mo_note_dao ).
  ENDMETHOD.

  METHOD get_uuid.
    cl_abap_unit_assert=>assert_equals(
        exp = '12345678901234560000000000000000'
        act = mo_cut->get_uuid( ) ).
  ENDMETHOD.

  METHOD get_title.
    cl_abap_testdouble=>configure_call( mo_note_dao )->returning( 'This is a title' ).
    mo_note_dao->get_title( ).
    cl_abap_unit_assert=>assert_equals(
        exp = 'This is a title'
        act = mo_cut->get_title( ) ).
  ENDMETHOD.

  METHOD get_body.
    cl_abap_testdouble=>configure_call( mo_note_dao )->returning( 'This is a body' ).
    mo_note_dao->get_body( ).
    cl_abap_unit_assert=>assert_equals(
        exp = 'This is a body'
        act = mo_cut->get_body( ) ).
  ENDMETHOD.

ENDCLASS.
