import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'recupera_pt1_widget.dart' show RecuperaPt1Widget;
import 'package:flutter/material.dart';

class RecuperaPt1Model extends FlutterFlowModel<RecuperaPt1Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for email widget.
  FocusNode? emailFocusNode1;
  TextEditingController? emailTextController1;
  String? Function(BuildContext, String?)? emailTextController1Validator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode2;
  TextEditingController? emailTextController2;
  String? Function(BuildContext, String?)? emailTextController2Validator;
  // Stores action output result for [Cloud Function - verificarUsuarioParaReset] action in Button widget.
  VerificarUsuarioParaResetCloudFunctionCallResponse? verificacaoResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailFocusNode1?.dispose();
    emailTextController1?.dispose();

    emailFocusNode2?.dispose();
    emailTextController2?.dispose();
  }
}
