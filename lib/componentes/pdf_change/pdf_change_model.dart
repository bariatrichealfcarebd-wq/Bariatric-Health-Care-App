import '/flutter_flow/flutter_flow_util.dart';
import 'pdf_change_widget.dart' show PdfChangeWidget;
import 'package:flutter/material.dart';

class PdfChangeModel extends FlutterFlowModel<PdfChangeWidget> {
  ///  Local state fields for this component.

  String? nomeDoArquivo;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeTextController;
  String? Function(BuildContext, String?)? nomeTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeFocusNode?.dispose();
    nomeTextController?.dispose();
  }
}
