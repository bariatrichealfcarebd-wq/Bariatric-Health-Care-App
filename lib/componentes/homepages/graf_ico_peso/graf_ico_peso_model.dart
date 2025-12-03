import '/backend/backend.dart';
import '/componentes/abas/no_internet_popu_p/no_internet_popu_p_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';

// codigo gerado automaticamente pelo flutterflow: página inicial
import '/index.dart';
import 'graf_ico_peso_widget.dart' show GrafIcoPesoWidget;
import 'package:flutter/material.dart';

class GrafIcoPesoModel extends FlutterFlowModel<GrafIcoPesoWidget> {
  // Campos de estado local para esta página.

  DateTime? data;

  // Campos de estado para os widgets desta página.

  // Armazena o resultado da ação [Custom Action - checkInternet] action in GrafIcoPeso widget.
  bool? temNet;
  // Armazena o resultado da ação [Backend Call - Read Document] action in GrafIcoPeso widget.
  PacienteRecord? pacienteData;
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
