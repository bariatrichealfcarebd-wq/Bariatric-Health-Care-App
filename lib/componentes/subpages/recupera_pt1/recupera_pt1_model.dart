import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/componentes/abas/no_internet_popu_p/no_internet_popu_p_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';

// codigo gerado automaticamente pelo flutterflow: subpágina da aplicação
import '/index.dart';
import 'recupera_pt1_widget.dart' show RecuperaPt1Widget;
import 'package:flutter/material.dart';

class RecuperaPt1Model extends FlutterFlowModel<RecuperaPt1Widget> {
  // Campos de estado para os widgets desta página.

  final formKey = GlobalKey<FormState>();
  // Armazena o resultado da ação [Custom Action - checkInternet] action in RecuperaPt1 widget.
  bool? temNet;
  // Campo(s) de estado para email widget.
  FocusNode? emailFocusNode1;
  TextEditingController? emailTextController1;
  String? Function(BuildContext, String?)? emailTextController1Validator;
  // Campo(s) de estado para email widget.
  FocusNode? emailFocusNode2;
  TextEditingController? emailTextController2;
  String? Function(BuildContext, String?)? emailTextController2Validator;
  // Armazena o resultado da ação [Cloud Function - verificarUsuarioParaReset] action in Button widget.
  VerificarUsuarioParaResetCloudFunctionCallResponse? verificacaoResult;
  // Model for NoInternetPopuP component.
  late NoInternetPopuPModel noInternetPopuPModel;

  @override
  void initState(BuildContext context) {
    noInternetPopuPModel = createModel(context, () => NoInternetPopuPModel());
  }

  @override
  void dispose() {
    emailFocusNode1?.dispose();
    emailTextController1?.dispose();

    emailFocusNode2?.dispose();
    emailTextController2?.dispose();

    noInternetPopuPModel.dispose();
  }
}
