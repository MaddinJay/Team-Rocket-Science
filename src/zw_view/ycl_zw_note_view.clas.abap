CLASS ycl_zw_note_view DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES yif_zw_note_view.

  PRIVATE SECTION.
    DATA mo_body_text_editor TYPE REF TO cl_gui_textedit.
    DATA mo_title_text_editor TYPE REF TO cl_gui_textedit.
    METHODS create_body_texteditor IMPORTING io_note TYPE REF TO yif_zw_note.
    METHODS create_title_texteditor
      IMPORTING
        io_note TYPE REF TO yif_zw_note.

ENDCLASS.

CLASS ycl_zw_note_view IMPLEMENTATION.

  METHOD yif_zw_note_view~create.
    create_title_texteditor( io_note ).
    create_body_texteditor( io_note ).
  ENDMETHOD.

  METHOD create_body_texteditor.
    DATA(lo_container) = NEW cl_gui_custom_container(
                                  container_name = 'YZW_NOTE_INFORMATIONS-BODY' ).
    mo_body_text_editor = NEW cl_gui_textedit(
                                  parent         = lo_container ).

    mo_body_text_editor->set_textstream( |{ io_note->get_title( ) }{ cl_abap_char_utilities=>cr_lf } { io_note->get_body( ) }| ).
    ##TODO " Exception Handling einbauen
  ENDMETHOD.

  METHOD create_title_texteditor.
    DATA(lo_container) = NEW cl_gui_custom_container(
                                  container_name = 'YZW_NOTE_INFORMATIONS-TITLE' ).
    mo_title_text_editor = NEW cl_gui_textedit(
                                  parent         = lo_container ).

    mo_title_text_editor->set_textstream( io_note->get_title( ) ).
  ENDMETHOD.

ENDCLASS.
