import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/componentes/abas/no_internet_popu_p/no_internet_popu_p_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';

// codigo gerado automaticamente pelo flutterflow: página da aplicação
import '/index.dart';
import 'questionario_widget.dart' show QuestionarioWidget;
import 'package:flutter/material.dart';

class QuestionarioModel extends FlutterFlowModel<QuestionarioWidget> {
  // Campos de estado local para esta página.
  /// defini se foi expandido
  bool isExpandable = false;

  bool popup = false;

  bool popupBoca = false;

  bool popupPele = false;

  bool poppupMembroSup = false;

  bool popupMembroinf = false;

  bool popupAlteracao = false;

  bool popupAlimentacao = false;

  // Campos de estado para os widgets desta página.

  // Armazena o resultado da ação [Custom Action - checkInternet] action in Questionario widget.
  bool? temNet;
  // Armazena o resultado da ação [Custom Action - gerarRelatorioParaGraficos] action in Button widget.
  String? gerarGrafico;
  // Armazena o resultado da ação [Firestore Query - Query a collection] action in Button widget.
  List<LigacaoSintomaRecord>? documentoParaApagar;
  // Armazena o resultado da ação [Cloud Function - enviarNotificacaoParaPaciente] action in Button widget.
  EnviarNotificacaoGenericaCloudFunctionCallResponse? cloudFunctionndj;
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
