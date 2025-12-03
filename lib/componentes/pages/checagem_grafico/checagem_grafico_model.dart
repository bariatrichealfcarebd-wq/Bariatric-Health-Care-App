import '/backend/backend.dart';
import '/componentes/abas/no_internet_popu_p/no_internet_popu_p_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';

// codigo gerado automaticamente pelo flutterflow: página da aplicação
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'checagem_grafico_widget.dart' show ChecagemGraficoWidget;
import 'package:flutter/material.dart';

class ChecagemGraficoModel extends FlutterFlowModel<ChecagemGraficoWidget> {
  // Campos de estado local para esta página.

  bool carregado = false;

  // Campos de estado para os widgets desta página.

  // Armazena o resultado da ação [Custom Action - checkInternet] action in checagemGrafico widget.
  bool? temNet;
  // Armazena o resultado da ação [Backend Call - Read Document] action in checagemGrafico widget.
  PacienteRecord? pacienteData;
  // Campo(s) de estado para Mesinicio widget.
  int? mesinicioValue;
  FormFieldController<int>? mesinicioValueController;
  // Campo(s) de estado para Mesfim widget.
  int? mesfimValue;
  FormFieldController<int>? mesfimValueController;
  // Campo(s) de estado para Ano widget.
  int? anoValue;
  FormFieldController<int>? anoValueController;
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
