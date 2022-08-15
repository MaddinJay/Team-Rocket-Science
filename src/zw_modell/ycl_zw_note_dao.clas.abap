class YCL_ZW_NOTE_DAO definition
  public
  create public .

public section.

  interfaces YIF_ZW_NOTE_DAO .
ENDCLASS.



CLASS YCL_ZW_NOTE_DAO IMPLEMENTATION.


  METHOD yif_zw_note_dao~read_notes.
    SELECT * FROM yzw_t_notes INTO TABLE @DATA(lt_notes).

    LOOP AT lt_notes INTO DATA(ls_note).
      DATA(lo_note) = NEW ycl_zw_note( iv_uuid = ls_note-uuid ).
      lo_note->yif_zw_note~set_title( ls_note-title ).
      lo_note->yif_zw_note~set_body( ls_note-body ).
      APPEND lo_note TO rt_notes.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
