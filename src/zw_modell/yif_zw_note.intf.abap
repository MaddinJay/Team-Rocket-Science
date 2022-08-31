INTERFACE yif_zw_note
  PUBLIC .

  METHODS get_uuid      RETURNING VALUE(rv_uuid)   TYPE yif_zw_note_types=>ty_uuid.
  METHODS get_title     RETURNING VALUE(rv_title)  TYPE yif_zw_note_types=>ty_title.
  METHODS get_body      RETURNING VALUE(rv_body)   TYPE yif_zw_note_types=>ty_body.
  METHODS get_father    RETURNING VALUE(rv_father) TYPE yif_zw_note_types=>ty_uuid.

ENDINTERFACE.
