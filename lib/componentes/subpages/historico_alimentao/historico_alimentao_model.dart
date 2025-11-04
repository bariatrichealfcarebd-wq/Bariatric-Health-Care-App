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

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in HistoricoAlimentao widget.
  PacienteRecord? pacienteData;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
