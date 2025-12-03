import '/flutter_flow/flutter_flow_util.dart';

// codigo gerado automaticamente pelo flutterflow: componente de interface do usuário
import 'trocarsenha_widget.dart' show TrocarsenhaWidget;
import 'package:flutter/material.dart';

class TrocarsenhaModel extends FlutterFlowModel<TrocarsenhaWidget> {
  // Campos de estado para os widgets deste componente.

  final formKey = GlobalKey<FormState>();
  // Campo(s) de estado para senhaAtual widget.
  FocusNode? senhaAtualFocusNode;
  TextEditingController? senhaAtualTextController;
  late bool senhaAtualVisibility;
  String? Function(BuildContext, String?)? senhaAtualTextControllerValidator;
  // Campo(s) de estado para senhaNova widget.
  FocusNode? senhaNovaFocusNode;
  TextEditingController? senhaNovaTextController;
  late bool senhaNovaVisibility;
  String? Function(BuildContext, String?)? senhaNovaTextControllerValidator;
  // Campo(s) de estado para senhaNova2 widget.
  FocusNode? senhaNova2FocusNode;
  TextEditingController? senhaNova2TextController;
  late bool senhaNova2Visibility;
  String? Function(BuildContext, String?)? senhaNova2TextControllerValidator;

  @override
  void initState(BuildContext context) {
    senhaAtualVisibility = false;
    senhaNovaVisibility = false;
    senhaNova2Visibility = false;
  }

  @override
  void dispose() {
    senhaAtualFocusNode?.dispose();
    senhaAtualTextController?.dispose();

    senhaNovaFocusNode?.dispose();
    senhaNovaTextController?.dispose();

    senhaNova2FocusNode?.dispose();
    senhaNova2TextController?.dispose();
  }
}
