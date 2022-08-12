CLASS ltcl_notes_list DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA mo_cut TYPE REF TO yif_zw_notes_list.
    METHODS:
      get_note_for_uuid FOR TESTING.
ENDCLASS.


CLASS ltcl_notes_list IMPLEMENTATION.

  METHOD get_note_for_uuid.
    mo_cut = NEW ycl_zw_notes_list( ).
    DATA(lo_note) = mo_cut->get_note( '300000000000' ).
    cl_abap_unit_assert=>assert_equals( exp = 'Note' act = lo_note->get_title( ) ).
  ENDMETHOD.

ENDCLASS.
