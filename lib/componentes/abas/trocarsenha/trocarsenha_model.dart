import '/flutter_flow/flutter_flow_util.dart';
import 'trocarsenha_widget.dart' show TrocarsenhaWidget;
import 'package:flutter/material.dart';

class TrocarsenhaModel extends FlutterFlowModel<TrocarsenhaWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for senhaAtual widget.
  FocusNode? senhaAtualFocusNode;
  TextEditingController? senhaAtualTextController;
  late bool senhaAtualVisibility;
  String? Function(BuildContext, String?)? senhaAtualTextControllerValidator;
  // State field(s) for senhaNova widget.
  FocusNode? senhaNovaFocusNode;
  TextEditingController? senhaNovaTextController;
  late bool senhaNovaVisibility;
  String? Function(BuildContext, String?)? senhaNovaTextControllerValidator;
  // State field(s) for senhaNova2 widget.
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
