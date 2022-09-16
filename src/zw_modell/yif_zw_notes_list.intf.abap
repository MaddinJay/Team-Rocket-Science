INTERFACE yif_zw_notes_list
  PUBLIC.

  "! <p class="shorttext synchronized" lang="en">
  "! Create the List of Notes for the application
  "! </p>
  METHODS create_notes.

  "! <p class="shorttext synchronized" lang="en">
  "! Update the List of Notes after User Changes
  "! </p>
  METHODS update_note.

  "! <p class="shorttext synchronized" lang="en">
  "! Returns the List of Notes
  "! </p>
  "! @parameter rt_notes | <p class="shorttext synchronized" lang="en">List of Notes</p>
  METHODS get_notes     RETURNING VALUE(rt_notes)     TYPE yif_zw_note_types=>tt_notes.
  "! <p class="shorttext synchronized" lang="en">
  "! Get one specific Note
  "! </p>
  "! @parameter iv_uuid | <p class="shorttext synchronized" lang="en">UUID of requested Note</p>
  "! @parameter ro_note | <p class="shorttext synchronized" lang="en">Requested Note</p>
  METHODS get_note      IMPORTING iv_uuid        TYPE yif_zw_note_types=>ty_uuid
                        RETURNING VALUE(ro_note) TYPE REF TO yif_zw_note.

ENDINTERFACE.
