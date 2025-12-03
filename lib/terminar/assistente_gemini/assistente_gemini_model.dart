import '/backend/api_requests/api_calls.dart';
import '/componentes/abas/no_internet_popu_p/no_internet_popu_p_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'assistente_gemini_widget.dart' show AssistenteGeminiWidget;
import 'package:flutter/material.dart';

class AssistenteGeminiModel extends FlutterFlowModel<AssistenteGeminiWidget> {
  // Campos de estado para os widgets desta página

  // Armazena o resultado da verificação de internet
  bool? temNet;
  // Campos de controle para o campo de texto
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Armazena a resposta da API Gemini
  ApiCallResponse? respostaAPI;
  // Modelo para o componente de popup sem internet
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
