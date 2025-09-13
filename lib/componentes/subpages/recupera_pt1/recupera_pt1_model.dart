import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'recupera_pt1_widget.dart' show RecuperaPt1Widget;
import 'package:flutter/material.dart';

class RecuperaPt1Model extends FlutterFlowModel<RecuperaPt1Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
