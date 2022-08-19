INTERFACE yif_zw_notes_list
  PUBLIC .

  METHODS get_relations RETURNING VALUE(rt_relations) TYPE yzw_tt_relations.
  METHODS get_notes     RETURNING VALUE(rt_notes)     TYPE yif_zw_note_types=>tt_notes.
  METHODS get_note      IMPORTING iv_uuid        TYPE yif_zw_note_types=>ty_uuid
                        RETURNING VALUE(ro_note) TYPE REF TO yif_zw_note.

ENDINTERFACE.
