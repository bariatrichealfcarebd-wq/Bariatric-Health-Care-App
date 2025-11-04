import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'alimentacao_page_widget.dart' show AlimentacaoPageWidget;
import 'package:flutter/material.dart';

class AlimentacaoPageModel extends FlutterFlowModel<AlimentacaoPageWidget> {
  ///  Local state fields for this page.
  ///
  DocumentReference? pdfshow;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in AlimentacaoPage widget.
  RelatoriosPdfRecord? carregarPdf;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
