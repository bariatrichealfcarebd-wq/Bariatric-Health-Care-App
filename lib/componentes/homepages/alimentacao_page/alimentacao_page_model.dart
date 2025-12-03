import '/componentes/abas/no_internet_popu_p/no_internet_popu_p_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'alimentacao_page_widget.dart' show AlimentacaoPageWidget;
import 'package:flutter/material.dart';

class AlimentacaoPageModel extends FlutterFlowModel<AlimentacaoPageWidget> {
  ///  Local state fields for this page.
  ///
  DocumentReference? pdfshow;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkInternet] action in AlimentacaoPage widget.
  bool? temNet;
  // Model for NoInternetPopuP component.
  late NoInternetPopuPModel noInternetPopuPModel;

  @override
  void initState(BuildContext context) {
    noInternetPopuPModel = createModel(context, () => NoInternetPopuPModel());
  }

  @override
  void dispose() {
    noInternetPopuPModel.dispose();
  }
}
