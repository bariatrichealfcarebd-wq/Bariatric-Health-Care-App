import '/componentes/abas/no_internet_popu_p/no_internet_popu_p_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';

// codigo gerado automaticamente pelo flutterflow: página inicial
import '/index.dart';
import 'questions_page_widget.dart' show QuestionsPageWidget;
import 'package:flutter/material.dart';

class QuestionsPageModel extends FlutterFlowModel<QuestionsPageWidget> {
  // Campos de estado para os widgets desta página.

  // Armazena o resultado da ação [Custom Action - checkInternet] action in QuestionsPage widget.
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
