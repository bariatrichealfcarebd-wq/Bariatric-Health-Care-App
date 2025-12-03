import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/componentes/abas/no_internet_popu_p/no_internet_popu_p_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'carregando_widget.dart' show CarregandoWidget;
import 'package:flutter/material.dart';

class CarregandoModel extends FlutterFlowModel<CarregandoWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkInternet] action in carregando widget.
  bool? temNet;
  // Stores action output result for [Backend Call - Read Document] action in carregando widget.
  PacienteRecord? pacienteData;
  // Stores action output result for [Backend Call - Read Document] action in carregando widget.
  PacienteRecord? readLogin;
  // Stores action output result for [Cloud Function - onFirstPatientLogin] action in carregando widget.
  OnFirstPatientLoginCloudFunctionCallResponse? primeiroLogin;
  // Model for NoInternetPopuP component.
  late NoInternetPopuPModel noInternetPopuPModel;

  @override
  void initState(BuildContext context) {
    noInternetPopuPModel = createModel(context, () => NoInternetPopuPModel());
  }

  @override
  void dispose() {
    noInternetPopuPModel.dispose();
  }
}
