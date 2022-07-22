INTERFACE yif_zw_gui_controller
  PUBLIC .
  TYPES: BEGIN OF ty_relations,
           node        TYPE tv_nodekey,
           node_father TYPE tv_nodekey,
         END OF ty_relations,
         tt_relations TYPE STANDARD TABLE OF ty_relations WITH DEFAULT KEY,

         tt_notes     TYPE STANDARD TABLE OF REF TO yif_zw_note WITH DEFAULT KEY.

  "! Create the Notes Tree of the "Zettelchen-Wirtschaft GUI"
  METHODS create_notes_tree.

ENDINTERFACE.
