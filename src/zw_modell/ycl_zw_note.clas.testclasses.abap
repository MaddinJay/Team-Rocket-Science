CLASS ltc_note DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA:
      mo_cut      TYPE REF TO yif_zw_note.
    METHODS:
      setup,
      get_uuid  FOR TESTING,
      get_title FOR TESTING,
      get_body FOR TESTING.
ENDCLASS.


CLASS ltc_note IMPLEMENTATION.

  METHOD setup.

    mo_cut = NEW ycl_zw_note( iv_uuid = '1234567890123456' ).
  ENDMETHOD.

  METHOD get_uuid.
    cl_abap_unit_assert=>assert_equals(
        exp = '12345678901234560000000000000000'
        act = mo_cut->get_uuid( ) ).
  ENDMETHOD.

  METHOD get_title.
    ##TODO " Get-Methode für Mock angepasst
    mo_cut->set_title( iv_title = 'This is a title' ).
    cl_abap_unit_assert=>assert_equals(
        exp = 'This is a title'
        act = mo_cut->get_title( ) ).
  ENDMETHOD.

  METHOD get_body.
    mo_cut->set_body( 'This is a body' ).
    cl_abap_unit_assert=>assert_equals(
        exp = 'This is a body'
        act = mo_cut->get_body( ) ).
  ENDMETHOD.

ENDCLASS.
