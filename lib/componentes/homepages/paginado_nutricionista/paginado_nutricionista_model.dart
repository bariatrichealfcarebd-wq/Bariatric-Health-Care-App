import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'paginado_nutricionista_widget.dart' show PaginadoNutricionistaWidget;
import 'package:flutter/material.dart';

class PaginadoNutricionistaModel
    extends FlutterFlowModel<PaginadoNutricionistaWidget> {
  ///  Local state fields for this page.

  String? nomeDoPaciente;

  ///  State fields for stateful widgets in this page.

  // State field(s) for campoCPF widget.
  final campoCPFKey = GlobalKey();
  FocusNode? campoCPFFocusNode;
  TextEditingController? campoCPFTextController;
  String? campoCPFSelectedOption;
  String? Function(BuildContext, String?)? campoCPFTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in campoCPF widget.
  PacienteRecord? pacienteNome;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  PacienteRecord? pesquisaDoPaciente;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    campoCPFFocusNode?.dispose();
  }
}
