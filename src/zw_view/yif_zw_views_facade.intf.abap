INTERFACE yif_zw_views_facade
  PUBLIC .

  "! Create the Tree View of the Zettelchen-Wirtschaft GUI
  METHODS create_tree_view IMPORTING io_notes TYPE REF TO yif_zw_notes_list.

  "! Create the Note View for visualization of the seelcted Note
  METHODS create_note_view IMPORTING io_note TYPE REF TO yif_zw_note.

ENDINTERFACE.
