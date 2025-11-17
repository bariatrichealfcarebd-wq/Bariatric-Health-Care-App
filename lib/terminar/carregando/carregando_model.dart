import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'carregando_widget.dart' show CarregandoWidget;
import 'package:flutter/material.dart';

class CarregandoModel extends FlutterFlowModel<CarregandoWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in carregando widget.
  PacienteRecord? pacienteData;
  // Stores action output result for [Backend Call - Read Document] action in carregando widget.
  PacienteRecord? readLogin;
  // Stores action output result for [Cloud Function - onFirstPatientLogin] action in carregando widget.
  OnFirstPatientLoginCloudFunctionCallResponse? primeiroLogin;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
