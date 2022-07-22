INTERFACE yif_note
  PUBLIC .
  METHODS get_uuid RETURNING VALUE(rv_uuid) TYPE yif_note_dao=>ty_uuid.
  METHODS get_body RETURNING VALUE(rv_body) TYPE yif_note_dao=>ty_body.
  METHODS get_title RETURNING VALUE(rv_title) TYPE yif_note_dao=>ty_title.

  METHODS set_uuid IMPORTING iv_uuid TYPE yif_note_dao=>ty_uuid.
  METHODS set_title IMPORTING iv_title TYPE yif_note_dao=>ty_title.
ENDINTERFACE.
