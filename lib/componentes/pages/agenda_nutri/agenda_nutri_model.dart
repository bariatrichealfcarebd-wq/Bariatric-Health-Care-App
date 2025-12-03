import '/backend/backend.dart';
import '/componentes/abas/no_internet_popu_p/no_internet_popu_p_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';

// codigo gerado automaticamente pelo flutterflow: página da aplicação
import '/index.dart';
import 'agenda_nutri_widget.dart' show AgendaNutriWidget;
import 'package:flutter/material.dart';

class AgendaNutriModel extends FlutterFlowModel<AgendaNutriWidget> {
  // Campos de estado para os widgets desta página.

  // Armazena o resultado da ação [Custom Action - checkInternet] action in AgendaNutri widget.
  bool? temNet;
  // Armazena o resultado da ação [Backend Call - Read Document] action in AgendaNutri widget.
  PacienteRecord? pacienteData;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Campo(s) de estado para TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Campo(s) de estado para Switch widget.
  bool? switchValue;
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
