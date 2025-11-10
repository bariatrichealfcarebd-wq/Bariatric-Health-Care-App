import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'historico_alimentao_widget.dart' show HistoricoAlimentaoWidget;
import 'package:flutter/material.dart';

class HistoricoAlimentaoModel
    extends FlutterFlowModel<HistoricoAlimentaoWidget> {
  ///  Local state fields for this page.

  List<dynamic> listaDePdfs = [];
  void addToListaDePdfs(dynamic item) => listaDePdfs.add(item);
  void removeFromListaDePdfs(dynamic item) => listaDePdfs.remove(item);
  void removeAtIndexFromListaDePdfs(int index) => listaDePdfs.removeAt(index);
  void insertAtIndexInListaDePdfs(int index, dynamic item) =>
      listaDePdfs.insert(index, item);
  void updateListaDePdfsAtIndex(int index, Function(dynamic) updateFn) =>
      listaDePdfs[index] = updateFn(listaDePdfs[index]);

  bool confirmar = false;

  DateTime? dataFiltrar;

  List<DocumentReference> listadePdfs = [];
  void addToListadePdfs(DocumentReference item) => listadePdfs.add(item);
  void removeFromListadePdfs(DocumentReference item) =>
      listadePdfs.remove(item);
  void removeAtIndexFromListadePdfs(int index) => listadePdfs.removeAt(index);
  void insertAtIndexInListadePdfs(int index, DocumentReference item) =>
      listadePdfs.insert(index, item);
  void updateListadePdfsAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      listadePdfs[index] = updateFn(listadePdfs[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in HistoricoAlimentao widget.
  PacienteRecord? pacienteData;
  // Stores action output result for [Firestore Query - Query a collection] action in HistoricoAlimentao widget.
  List<RelatoriosPdfRecord>? filtronutri;
  // Stores action output result for [Firestore Query - Query a collection] action in HistoricoAlimentao widget.
  List<RelatoriosPdfRecord>? filtroteste2;
  DateTime? datePicked;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  List<RelatoriosPdfRecord>? filtronutridata;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  List<RelatoriosPdfRecord>? filtrotestdata;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<RelatoriosPdfRecord>? filtronutri3;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<RelatoriosPdfRecord>? filtroteste3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
