*&---------------------------------------------------------------------*
*& Report y_zettelchen_wirtschaft
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT y_zettelchen_wirtschaft.

INCLUDE y_zettelchen_wirtsch_top.
INCLUDE y_zettelchen_wirtsch_pboo0100.
INCLUDE y_zettelchen_wirtsch_pai_0100.

START-OF-SELECTION.

  go_controller = NEW ycl_zw_gui_controller( ).


  CALL SCREEN '0100'.
