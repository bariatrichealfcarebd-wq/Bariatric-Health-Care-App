import '/componentes/abas/no_internet_popu_p/no_internet_popu_p_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';

// codigo gerado automaticamente pelo flutterflow: subpágina da aplicação
import '/index.dart';
import 'recuperar_pt2_widget.dart' show RecuperarPt2Widget;
import 'package:flutter/material.dart';

class RecuperarPt2Model extends FlutterFlowModel<RecuperarPt2Widget> {
  // Campos de estado para os widgets desta página.

  // Armazena o resultado da ação [Custom Action - checkInternet] action in RecuperarPt2 widget.
  bool? temNet;
  // Campo(s) de estado para NovaSenha widget.
  FocusNode? novaSenhaFocusNode;
  TextEditingController? novaSenhaTextController;
  late bool novaSenhaVisibility;
  String? Function(BuildContext, String?)? novaSenhaTextControllerValidator;
  // Campo(s) de estado para ConfirmSenha widget.
  FocusNode? confirmSenhaFocusNode;
  TextEditingController? confirmSenhaTextController;
  late bool confirmSenhaVisibility;
  String? Function(BuildContext, String?)? confirmSenhaTextControllerValidator;
  // Model for NoInternetPopuP component.
  late NoInternetPopuPModel noInternetPopuPModel;

  @override
  void initState(BuildContext context) {
    novaSenhaVisibility = false;
    confirmSenhaVisibility = false;
    noInternetPopuPModel = createModel(context, () => NoInternetPopuPModel());
  }

  @override
  void dispose() {
    novaSenhaFocusNode?.dispose();
    novaSenhaTextController?.dispose();

    confirmSenhaFocusNode?.dispose();
    confirmSenhaTextController?.dispose();

    noInternetPopuPModel.dispose();
  }
}
