INTERFACE yif_zw_note_dao
  PUBLIC .

  METHODS get_title RETURNING VALUE(rv_title) TYPE yif_zw_note=>ty_title.
  METHODS get_body RETURNING VALUE(rv_body) TYPE yif_zw_note=>ty_body.

ENDINTERFACE.
