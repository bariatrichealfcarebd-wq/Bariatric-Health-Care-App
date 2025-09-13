import '/flutter_flow/flutter_flow_util.dart';
import 'centralde_ajuda_widget.dart' show CentraldeAjudaWidget;
import 'package:flutter/material.dart';

class CentraldeAjudaModel extends FlutterFlowModel<CentraldeAjudaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
