INTERFACE yif_zw_get_notes
  PUBLIC .
  TYPES: BEGIN OF ts_relations,
           node   TYPE tv_nodekey,
           father TYPE tv_nodekey,
         END OF ts_relations,
         tt_relations TYPE SORTED TABLE OF ts_relations WITH UNIQUE KEY node.

  METHODS get_relations RETURNING VALUE(rt_relations) TYPE tt_relations.
  METHODS get_notes     RETURNING VALUE(rt_notes)     TYPE yif_zw_note=>tt_notes.

ENDINTERFACE.
