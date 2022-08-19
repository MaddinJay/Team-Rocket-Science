INTERFACE yif_zw_note_types
  PUBLIC .
  TYPES tt_notes TYPE STANDARD TABLE OF REF TO yif_zw_note WITH DEFAULT KEY.
  TYPES ty_uuid TYPE sysuuid_x16.
  TYPES ty_title TYPE text180.
  TYPES ty_body TYPE string.

ENDINTERFACE.
