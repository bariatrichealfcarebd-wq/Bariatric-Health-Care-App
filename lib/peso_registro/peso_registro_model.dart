import '/flutter_flow/flutter_flow_util.dart';
import 'peso_registro_widget.dart' show PesoRegistroWidget;
import 'package:flutter/material.dart';

class PesoRegistroModel extends FlutterFlowModel<PesoRegistroWidget> {
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
