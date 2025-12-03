import '/componentes/abas/no_internet_popu_p/no_internet_popu_p_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';

// codigo gerado automaticamente pelo flutterflow: página inicial
import '/index.dart';
import 'alimentacao_page_widget.dart' show AlimentacaoPageWidget;
import 'package:flutter/material.dart';

class AlimentacaoPageModel extends FlutterFlowModel<AlimentacaoPageWidget> {
  // Campos de estado local para esta página.
  ///
  DocumentReference? pdfshow;

  // Campos de estado para os widgets desta página.

  // Armazena o resultado da ação [Custom Action - checkInternet] action in AlimentacaoPage widget.
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
