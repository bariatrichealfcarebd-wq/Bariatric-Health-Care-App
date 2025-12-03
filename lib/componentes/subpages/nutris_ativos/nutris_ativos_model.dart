import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/componentes/abas/no_internet_popu_p/no_internet_popu_p_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'nutris_ativos_widget.dart' show NutrisAtivosWidget;
import 'package:flutter/material.dart';

class NutrisAtivosModel extends FlutterFlowModel<NutrisAtivosWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkInternet] action in nutrisAtivos widget.
  bool? temNet;
  // Stores action output result for [Cloud Function - deleteNutricionistaAndTeam] action in IconButton widget.
  DeleteNutricionistaAndTeamCloudFunctionCallResponse? cloudFunctionh3a;
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
