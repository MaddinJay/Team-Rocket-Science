INTERFACE yif_zw_views_facade
  PUBLIC .

  "! <p class="shorttext synchronized" lang="en">
  "! Create the Tree View of the Zettelchen-Wirtschaft GUI
  "!</p>
  METHODS create_tree_view IMPORTING io_notes TYPE REF TO yif_zw_notes_list.

  "! <p class="shorttext synchronized" lang="en">
  "! Create the Note View for visualization of the seelcted Note
  "! </p>
  METHODS create_note_view IMPORTING io_note TYPE REF TO yif_zw_note.

  "! <p class="shorttext synchronized" lang="en">
  "! Read the Note that is visualized in the Subscreen
  "! </p>
  METHODS update_processed_note.

ENDINTERFACE.
