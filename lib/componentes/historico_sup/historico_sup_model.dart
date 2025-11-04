import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'historico_sup_widget.dart' show HistoricoSupWidget;
import 'package:flutter/material.dart';

class HistoricoSupModel extends FlutterFlowModel<HistoricoSupWidget> {
  ///  Local state fields for this page.

  DocumentReference? pacienteData;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in HistoricoSup widget.
  PacienteRecord? listarSup;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
