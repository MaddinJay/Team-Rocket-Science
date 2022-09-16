CLASS ltcl_notes_list DEFINITION DEFERRED.
CLASS ycl_zw_notes_list DEFINITION LOCAL FRIENDS ltcl_notes_list.

CLASS ltcl_notes_list DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA mo_cut TYPE REF TO yif_zw_notes_list.
    DATA mo_notes_dao TYPE REF TO yif_zw_note_dao.

    METHODS:
      setup,
      building_notes_ok FOR TESTING,
      update_notes_list_ok FOR TESTING.

ENDCLASS.

CLASS ltcl_notes_list IMPLEMENTATION.

  METHOD setup.
    mo_cut = NEW ycl_zw_notes_list( NEW ltd_note_dao( ) ).
    mo_cut->create_notes( ).
  ENDMETHOD.

  METHOD building_notes_ok.
    DATA(lo_note) = mo_cut->get_note( '10000000000000000000000000000000' ).
    cl_abap_unit_assert=>assert_equals( exp = '10000000000000000000000000000000'
                                        act = lo_note->get_uuid( ) ).
  ENDMETHOD.

  METHOD update_notes_list_ok.
    DATA(lt_notes) = mo_cut->get_notes( ).
    TRY.
        mo_cut->update_note( ).
      CATCH ycx_zw_exception INTO DATA(lo_error).
        cl_abap_unit_assert=>fail( lo_error->get_message( ) ).
    ENDTRY.
  ENDMETHOD.

ENDCLASS.
