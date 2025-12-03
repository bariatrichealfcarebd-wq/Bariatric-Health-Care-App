import '/flutter_flow/flutter_flow_util.dart';

// codigo gerado automaticamente pelo flutterflow: página da aplicação
import '/index.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  // Campos de estado para os widgets desta página.

  // Campo(s) de estado para campoCPF widget.
  FocusNode? campoCPFFocusNode;
  TextEditingController? campoCPFTextController;
  String? Function(BuildContext, String?)? campoCPFTextControllerValidator;
  // Campo(s) de estado para CampoSenha widget.
  FocusNode? campoSenhaFocusNode;
  TextEditingController? campoSenhaTextController;
  late bool campoSenhaVisibility;
  String? Function(BuildContext, String?)? campoSenhaTextControllerValidator;
  // Armazena o resultado da ação [Custom Action - manualLogin] action in Button widget.
  String? loginResult;

  @override
  void initState(BuildContext context) {
    campoSenhaVisibility = false;
  }

  @override
  void dispose() {
    campoCPFFocusNode?.dispose();
    campoCPFTextController?.dispose();

    campoSenhaFocusNode?.dispose();
    campoSenhaTextController?.dispose();
  }
}
