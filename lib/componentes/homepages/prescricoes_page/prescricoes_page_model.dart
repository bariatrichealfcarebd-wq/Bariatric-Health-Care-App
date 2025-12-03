import '/componentes/abas/no_internet_popu_p/no_internet_popu_p_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';

// codigo gerado automaticamente pelo flutterflow: página inicial
import '/index.dart';
import 'prescricoes_page_widget.dart' show PrescricoesPageWidget;
import 'package:flutter/material.dart';

class PrescricoesPageModel extends FlutterFlowModel<PrescricoesPageWidget> {
  // Campos de estado local para esta página.

  bool isOffline = false;

  // Campos de estado para os widgets desta página.

  // Armazena o resultado da ação [Custom Action - checkInternet] action in PrescricoesPage widget.
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
