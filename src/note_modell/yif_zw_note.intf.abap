INTERFACE yif_zw_note
  PUBLIC .
  TYPES tt_notes TYPE STANDARD TABLE OF REF TO yif_zw_note WITH DEFAULT KEY.
  TYPES ty_uuid TYPE sysuuid_x16.
  TYPES ty_title TYPE string.
  TYPES ty_body TYPE string.


  METHODS get_uuid RETURNING VALUE(rv_uuid) TYPE ty_uuid.
  METHODS get_title RETURNING VALUE(rv_title) TYPE ty_title.
  METHODS get_body RETURNING VALUE(rv_body) TYPE ty_body.

ENDINTERFACE.
