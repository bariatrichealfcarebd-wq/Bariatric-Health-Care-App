import '/flutter_flow/flutter_flow_util.dart';

// codigo gerado automaticamente pelo flutterflow: componente de interface do usuário
import 'pdf_change_widget.dart' show PdfChangeWidget;
import 'package:flutter/material.dart';

class PdfChangeModel extends FlutterFlowModel<PdfChangeWidget> {
  // Campos de estado local para este componente.

  String? nomeDoArquivo;

  // Campos de estado para os widgets deste componente.

  // Campo(s) de estado para Nome widget.
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
