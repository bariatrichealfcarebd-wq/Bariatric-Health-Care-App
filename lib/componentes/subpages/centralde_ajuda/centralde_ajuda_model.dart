import '/componentes/abas/no_internet_popu_p/no_internet_popu_p_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';

// codigo gerado automaticamente pelo flutterflow: subpágina da aplicação
import '/index.dart';
import 'centralde_ajuda_widget.dart' show CentraldeAjudaWidget;
import 'package:flutter/material.dart';

class CentraldeAjudaModel extends FlutterFlowModel<CentraldeAjudaWidget> {
  // Campos de estado para os widgets desta página.

  // Armazena o resultado da ação [Custom Action - checkInternet] action in CentraldeAjuda widget.
  bool? temNet;
  // Campo(s) de estado para TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for NoInternetPopuP component.
  late NoInternetPopuPModel noInternetPopuPModel;

  @override
  void initState(BuildContext context) {
    noInternetPopuPModel = createModel(context, () => NoInternetPopuPModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    noInternetPopuPModel.dispose();
  }
}
