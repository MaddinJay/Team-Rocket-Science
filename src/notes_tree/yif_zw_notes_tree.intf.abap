INTERFACE yif_zw_notes_tree
  PUBLIC .
  TYPES: tt_items TYPE STANDARD TABLE OF mtreeitm WITH DEFAULT KEY.

  "! Create the Notes-Tree-Object of the Zettelchen-Wirtschaft GUI
  METHODS create_tree IMPORTING io_notes TYPE REF TO yif_zw_get_notes.

ENDINTERFACE.
