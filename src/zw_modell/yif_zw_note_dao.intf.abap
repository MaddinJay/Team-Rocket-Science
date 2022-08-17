INTERFACE yif_zw_note_dao
  PUBLIC .

  METHODS read_notes RETURNING VALUE(rt_notes) TYPE yzw_tt_notes.

ENDINTERFACE.
