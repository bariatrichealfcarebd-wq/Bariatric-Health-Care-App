import '/backend/backend.dart';
import '/componentes/abas/no_internet_popu_p/no_internet_popu_p_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'checagem_grafico_widget.dart' show ChecagemGraficoWidget;
import 'package:flutter/material.dart';

class ChecagemGraficoModel extends FlutterFlowModel<ChecagemGraficoWidget> {
  ///  Local state fields for this page.

  bool carregado = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkInternet] action in checagemGrafico widget.
  bool? temNet;
  // Stores action output result for [Backend Call - Read Document] action in checagemGrafico widget.
  PacienteRecord? pacienteData;
  // State field(s) for Mesinicio widget.
  int? mesinicioValue;
  FormFieldController<int>? mesinicioValueController;
  // State field(s) for Mesfim widget.
  int? mesfimValue;
  FormFieldController<int>? mesfimValueController;
  // State field(s) for Ano widget.
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
