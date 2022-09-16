INTERFACE yif_zw_note_dao
  PUBLIC.

  "! <p class="shorttext synchronized" lang="de">
  "! Read Notes Informations from DB
  "! </p>
  "! @parameter rt_notes | Notes in DB structure form yzw_t_notes
  METHODS read_notes   RETURNING VALUE(rt_notes) TYPE yzw_tt_notes.

  "! <p class="shorttext synchronized" lang="de">
  "! Update Notes Informations in DB
  "! </p>
  "! @parameter it_notes | Notes in DB structure from yzw_t_notes
  METHODS update_notes IMPORTING it_notes TYPE yzw_tt_notes.

ENDINTERFACE.
