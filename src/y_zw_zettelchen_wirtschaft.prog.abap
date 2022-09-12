*&---------------------------------------------------------------------*
*& Report y_zw_zettelchen_wirtschaft
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT y_zw_zettelchen_wirtschaft.

INCLUDE y_zw_top.
INCLUDE y_zw_pai_0100.
INCLUDE y_zw_pbo_0100.

START-OF-SELECTION.

  go_controller = NEW ycl_zw_gui_controller( ).

  CALL SCREEN '0100'.
