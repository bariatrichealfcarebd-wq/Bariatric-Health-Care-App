import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'questionario_widget.dart' show QuestionarioWidget;
import 'package:flutter/material.dart';

class QuestionarioModel extends FlutterFlowModel<QuestionarioWidget> {
  ///  Local state fields for this page.
  /// defini se foi expandido
  bool isExpandable = false;

  bool popup = false;

  bool popupBoca = false;

  bool popupPele = false;

  bool poppupMembroSup = false;

  bool popupMembroinf = false;

  bool popupAlteracao = false;

  bool popupAlimentacao = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<LigacaoSintomaRecord>? documentoParaApagar;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
