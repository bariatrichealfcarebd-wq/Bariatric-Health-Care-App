import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/componentes/abas/no_internet_popu_p/no_internet_popu_p_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';

// codigo gerado automaticamente pelo flutterflow: página da aplicação
import '/index.dart';
import 'seguranaca_privacidade_widget.dart' show SeguranacaPrivacidadeWidget;
import 'package:flutter/material.dart';

class SeguranacaPrivacidadeModel
    extends FlutterFlowModel<SeguranacaPrivacidadeWidget> {
  // Campos de estado para os widgets desta página.

  // Armazena o resultado da ação [Custom Action - checkInternet] action in Seguranaca_Privacidade widget.
  bool? temNet;
  // Armazena o resultado da ação [Cloud Function - deleteNutricionistaAndTeam] action in Button widget.
  DeleteNutricionistaAndTeamCloudFunctionCallResponse? cloudFunctionpy3;
  // Armazena o resultado da ação [Cloud Function - deleteUserAccount] action in Button widget.
  DeleteUserAccountCloudFunctionCallResponse? deletarconta;
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
