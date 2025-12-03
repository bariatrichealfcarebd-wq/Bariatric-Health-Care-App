import '/backend/backend.dart';
import '/componentes/abas/no_internet_popu_p/no_internet_popu_p_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'graf_ico_peso_widget.dart' show GrafIcoPesoWidget;
import 'package:flutter/material.dart';

class GrafIcoPesoModel extends FlutterFlowModel<GrafIcoPesoWidget> {
  ///  Local state fields for this page.

  DateTime? data;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkInternet] action in GrafIcoPeso widget.
  bool? temNet;
  // Stores action output result for [Backend Call - Read Document] action in GrafIcoPeso widget.
  PacienteRecord? pacienteData;
  // State field(s) for TextField widget.
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
