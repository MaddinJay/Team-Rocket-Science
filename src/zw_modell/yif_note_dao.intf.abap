INTERFACE yif_note_dao
  PUBLIC .
  TYPES: ty_uuid  TYPE sysuuid_x16,
         ty_body  TYPE string,
         ty_title TYPE text180.
  METHODS get_uuid RETURNING VALUE(rv_uuid) TYPE ty_uuid.
  METHODS get_body RETURNING VALUE(rv_body) TYPE ty_body.
  METHODS get_title RETURNING VALUE(rv_title) TYPE ty_title.
ENDINTERFACE.
