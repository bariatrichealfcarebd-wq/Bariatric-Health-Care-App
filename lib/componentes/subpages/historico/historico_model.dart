import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'historico_widget.dart' show HistoricoWidget;
import 'package:flutter/material.dart';

class HistoricoModel extends FlutterFlowModel<HistoricoWidget> {
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

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in Historico widget.
  PacienteRecord? pacienteData;
  // Stores action output result for [Custom Action - listarPdfsDoPaciente] action in Historico widget.
  List<dynamic>? resultadoDaBusca;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
