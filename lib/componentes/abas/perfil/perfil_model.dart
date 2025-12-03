import '/flutter_flow/flutter_flow_util.dart';
import 'perfil_widget.dart' show PerfilWidget;
import 'package:flutter/material.dart';

class PerfilModel extends FlutterFlowModel<PerfilWidget> {
  ///  Local state fields for this component.

  bool editar = false;

  /// selecionar o dia e ele vai guardar
  DateTime? datee;

  ///  State fields for stateful widgets in this component.

  // State field(s) for nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeTextController;
  String? Function(BuildContext, String?)? nomeTextControllerValidator;
  // State field(s) for data widget.
  FocusNode? dataFocusNode1;
  TextEditingController? dataTextController1;
  String? Function(BuildContext, String?)? dataTextController1Validator;
  // State field(s) for data widget.
  FocusNode? dataFocusNode2;
  TextEditingController? dataTextController2;
  String? Function(BuildContext, String?)? dataTextController2Validator;
  // State field(s) for data widget.
  FocusNode? dataFocusNode3;
  TextEditingController? dataTextController3;
  String? Function(BuildContext, String?)? dataTextController3Validator;
  // State field(s) for data widget.
  FocusNode? dataFocusNode4;
  TextEditingController? dataTextController4;
  String? Function(BuildContext, String?)? dataTextController4Validator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeFocusNode?.dispose();
    nomeTextController?.dispose();

    dataFocusNode1?.dispose();
    dataTextController1?.dispose();

    dataFocusNode2?.dispose();
    dataTextController2?.dispose();

    dataFocusNode3?.dispose();
    dataTextController3?.dispose();

    dataFocusNode4?.dispose();
    dataTextController4?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
