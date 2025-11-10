import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'historico_widget.dart' show HistoricoWidget;
import 'package:flutter/material.dart';

class HistoricoModel extends FlutterFlowModel<HistoricoWidget> {
  ///  Local state fields for this page.

  bool confirmar = false;

  DateTime? dataFiltrar;

  List<DocumentReference> relatoriosList = [];
  void addToRelatoriosList(DocumentReference item) => relatoriosList.add(item);
  void removeFromRelatoriosList(DocumentReference item) =>
      relatoriosList.remove(item);
  void removeAtIndexFromRelatoriosList(int index) =>
      relatoriosList.removeAt(index);
  void insertAtIndexInRelatoriosList(int index, DocumentReference item) =>
      relatoriosList.insert(index, item);
  void updateRelatoriosListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      relatoriosList[index] = updateFn(relatoriosList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in Historico widget.
  PacienteRecord? pacienteData;
  // Stores action output result for [Firestore Query - Query a collection] action in Historico widget.
  List<RelatoriosQuestionarioRecord>? filtronutri;
  // Stores action output result for [Firestore Query - Query a collection] action in Historico widget.
  List<RelatoriosQuestionarioRecord>? filtroteste;
  DateTime? datePicked;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  List<RelatoriosQuestionarioRecord>? filtronutridata;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  List<RelatoriosQuestionarioRecord>? filtrotestdata;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
