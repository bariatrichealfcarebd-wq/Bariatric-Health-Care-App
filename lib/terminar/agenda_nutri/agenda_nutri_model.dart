import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'agenda_nutri_widget.dart' show AgendaNutriWidget;
import 'package:flutter/material.dart';

class AgendaNutriModel extends FlutterFlowModel<AgendaNutriWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in AgendaNutri widget.
  PacienteRecord? pacienteData;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
