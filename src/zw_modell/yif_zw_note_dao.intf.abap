INTERFACE yif_zw_note_dao
  PUBLIC.

  "! Read Notes Informations from DB
  "! @parameter rt_notes | Notes in DB structure form yzw_t_notes
  METHODS read_notes RETURNING VALUE(rt_notes) TYPE yzw_tt_notes.

ENDINTERFACE.
