import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tipodesuplementodiario_widget.dart' show TipodesuplementodiarioWidget;
import 'package:flutter/material.dart';

class TipodesuplementodiarioModel
    extends FlutterFlowModel<TipodesuplementodiarioWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in Tipodesuplementodiario widget.
  PacienteRecord? pacienteData;
  // State field(s) for TipoDeSuplemento widget.
  FocusNode? tipoDeSuplementoFocusNode;
  TextEditingController? tipoDeSuplementoTextController;
  String? Function(BuildContext, String?)?
      tipoDeSuplementoTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textFieldTextController;
  String? Function(BuildContext, String?)? textFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tipoDeSuplementoFocusNode?.dispose();
    tipoDeSuplementoTextController?.dispose();

    textFieldFocusNode?.dispose();
    textFieldTextController?.dispose();
  }
}
