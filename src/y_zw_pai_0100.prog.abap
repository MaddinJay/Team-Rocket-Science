*&---------------------------------------------------------------------*
*& Include          Y_ZW_PAI_0100
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
  CASE sy-ucomm.
    WHEN 'SAVE'.
      go_controller->save_note_informations( ).
    WHEN 'EXIT'.
      LEAVE TO SCREEN 0.
  ENDCASE.
ENDMODULE.