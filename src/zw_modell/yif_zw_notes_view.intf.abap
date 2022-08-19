INTERFACE yif_zw_notes_view
  PUBLIC .

  "! Create the Tree View of the Zettelchen-Wirtschaft GUI
  METHODS create IMPORTING io_notes TYPE REF TO yif_zw_notes_list.

ENDINTERFACE.
