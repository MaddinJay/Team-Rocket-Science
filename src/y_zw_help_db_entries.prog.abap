*&---------------------------------------------------------------------*
*& Report y_zw_help_db_entries
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT y_zw_help_db_entries.

DATA ls_note TYPE yzw_t_notes.


ls_note-uuid  = '100000000000'.
ls_note-title = 'Root'.
ls_note-body  = 'Dies ist ein Text'.
ls_note-father = ''.
INSERT yzw_t_notes FROM ls_note.

ls_note-uuid  = '200000000000'.
ls_note-title = 'Folder'.
ls_note-father = '100000000000'.
INSERT yzw_t_notes FROM ls_note.

ls_note-uuid  = '30000000000'.
ls_note-title = 'Note'.
ls_note-body  = 'Dies ist ein Text'.
ls_note-father = '20000000000'.
INSERT yzw_t_notes FROM ls_note.
