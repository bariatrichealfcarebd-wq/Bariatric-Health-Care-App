import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'checagem_grafico_widget.dart' show ChecagemGraficoWidget;
import 'package:flutter/material.dart';

class ChecagemGraficoModel extends FlutterFlowModel<ChecagemGraficoWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in checagemGrafico widget.
  PacienteRecord? pacienteData;
  // State field(s) for Mesinicio widget.
  int? mesinicioValue;
  FormFieldController<int>? mesinicioValueController;
  // State field(s) for Mesfim widget.
  int? mesfimValue;
  FormFieldController<int>? mesfimValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
