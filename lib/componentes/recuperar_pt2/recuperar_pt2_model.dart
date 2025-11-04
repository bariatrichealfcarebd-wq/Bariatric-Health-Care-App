import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'recuperar_pt2_widget.dart' show RecuperarPt2Widget;
import 'package:flutter/material.dart';

class RecuperarPt2Model extends FlutterFlowModel<RecuperarPt2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for NovaSenha widget.
  FocusNode? novaSenhaFocusNode;
  TextEditingController? novaSenhaTextController;
  late bool novaSenhaVisibility;
  String? Function(BuildContext, String?)? novaSenhaTextControllerValidator;
  // State field(s) for ConfirmSenha widget.
  FocusNode? confirmSenhaFocusNode;
  TextEditingController? confirmSenhaTextController;
  late bool confirmSenhaVisibility;
  String? Function(BuildContext, String?)? confirmSenhaTextControllerValidator;

  @override
  void initState(BuildContext context) {
    novaSenhaVisibility = false;
    confirmSenhaVisibility = false;
  }

  @override
  void dispose() {
    novaSenhaFocusNode?.dispose();
    novaSenhaTextController?.dispose();

    confirmSenhaFocusNode?.dispose();
    confirmSenhaTextController?.dispose();
  }
}
