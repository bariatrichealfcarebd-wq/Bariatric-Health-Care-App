import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'cadastro_widget.dart' show CadastroWidget;
import 'package:flutter/material.dart';

class CadastroModel extends FlutterFlowModel<CadastroWidget> {
  ///  Local state fields for this page.

  bool check = false;

  bool validarSenha = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for NomeCadastro widget.
  FocusNode? nomeCadastroFocusNode;
  TextEditingController? nomeCadastroTextController;
  String? Function(BuildContext, String?)? nomeCadastroTextControllerValidator;
  // State field(s) for CPFCadastro widget.
  FocusNode? cPFCadastroFocusNode;
  TextEditingController? cPFCadastroTextController;
  String? Function(BuildContext, String?)? cPFCadastroTextControllerValidator;
  // State field(s) for EmailCadastro widget.
  FocusNode? emailCadastroFocusNode;
  TextEditingController? emailCadastroTextController;
  String? Function(BuildContext, String?)? emailCadastroTextControllerValidator;
  // State field(s) for senha widget.
  FocusNode? senhaFocusNode;
  TextEditingController? senhaTextController;
  late bool senhaVisibility;
  String? Function(BuildContext, String?)? senhaTextControllerValidator;
  // State field(s) for senhaConfirm widget.
  FocusNode? senhaConfirmFocusNode;
  TextEditingController? senhaConfirmTextController;
  late bool senhaConfirmVisibility;
  String? Function(BuildContext, String?)? senhaConfirmTextControllerValidator;

  @override
  void initState(BuildContext context) {
    senhaVisibility = false;
    senhaConfirmVisibility = false;
  }

  @override
  void dispose() {
    nomeCadastroFocusNode?.dispose();
    nomeCadastroTextController?.dispose();

    cPFCadastroFocusNode?.dispose();
    cPFCadastroTextController?.dispose();

    emailCadastroFocusNode?.dispose();
    emailCadastroTextController?.dispose();

    senhaFocusNode?.dispose();
    senhaTextController?.dispose();

    senhaConfirmFocusNode?.dispose();
    senhaConfirmTextController?.dispose();
  }
}
