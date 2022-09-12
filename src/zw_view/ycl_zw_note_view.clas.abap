CLASS ycl_zw_note_view DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES yif_zw_note_view.

  PRIVATE SECTION.
    DATA mo_body_text_editor TYPE REF TO cl_gui_textedit.
    DATA mo_title_text_editor TYPE REF TO cl_gui_textedit.

    METHODS create_body_texteditor  IMPORTING io_note TYPE REF TO yif_zw_note.

    METHODS build_note_text_block   IMPORTING io_note              TYPE REF TO yif_zw_note
                                    RETURNING VALUE(rv_text_block) TYPE string.
    METHODS build_text_editor_container RETURNING VALUE(ro_container) TYPE REF TO cl_gui_container.


ENDCLASS.

CLASS ycl_zw_note_view IMPLEMENTATION.

  METHOD yif_zw_note_view~create.
    create_body_texteditor( io_note ).
  ENDMETHOD.

  METHOD create_body_texteditor.
    mo_body_text_editor = NEW cl_gui_textedit( parent = build_text_editor_container( ) ).

    mo_body_text_editor->set_textstream( build_note_text_block( io_note ) ).
    ##TODO " Exception Handling einbauen
  ENDMETHOD.

  METHOD build_note_text_block.
    rv_text_block = |{ io_note->get_title( ) }{ cl_abap_char_utilities=>cr_lf }{ cl_abap_char_utilities=>cr_lf }{ io_note->get_body( ) }|.
  ENDMETHOD.

  METHOD build_text_editor_container.
    ro_container = NEW cl_gui_custom_container(
                         container_name = 'YZW_NOTE_INFORMATIONS-BODY' ).
  ENDMETHOD.

ENDCLASS.
