import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for campoCPF widget.
  FocusNode? campoCPFFocusNode;
  TextEditingController? campoCPFTextController;
  String? Function(BuildContext, String?)? campoCPFTextControllerValidator;
  // State field(s) for CampoSenha widget.
  FocusNode? campoSenhaFocusNode;
  TextEditingController? campoSenhaTextController;
  late bool campoSenhaVisibility;
  String? Function(BuildContext, String?)? campoSenhaTextControllerValidator;
  // Stores action output result for [Custom Action - manualLogin] action in Button widget.
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
