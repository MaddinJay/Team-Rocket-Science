INTERFACE yif_zw_note_view
  PUBLIC .

  "! <p class="shorttext synchronized" lang="en">
  "! Create the Note View for the selected Note
  "!</p>
  METHODS create IMPORTING io_note TYPE REF TO yif_zw_note.

  "! <p class="shorttext synchronized" lang="en">
  "! Get the processed Note
  "!</p>
  METHODS update_processed_note.

ENDINTERFACE.
