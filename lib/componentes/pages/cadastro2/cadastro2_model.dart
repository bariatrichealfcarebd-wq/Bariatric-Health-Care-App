import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/componentes/abas/no_internet_popu_p/no_internet_popu_p_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';

// codigo gerado automaticamente pelo flutterflow: página da aplicação
import '/index.dart';
import 'cadastro2_widget.dart' show Cadastro2Widget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Cadastro2Model extends FlutterFlowModel<Cadastro2Widget> {
  // Campos de estado local para esta página.

  bool visible = false;

  bool isAdmChecked = false;

  bool admLessChecked = false;

  // Campos de estado para os widgets desta página.

  final formKey = GlobalKey<FormState>();
  // Armazena o resultado da ação [Custom Action - checkInternet] action in Cadastro2 widget.
  bool? temNet;
  // Campo(s) de estado para TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Campo(s) de estado para TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  late MaskTextInputFormatter textFieldMask2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Campo(s) de estado para TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  late MaskTextInputFormatter textFieldMask3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Campo(s) de estado para TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // Campo(s) de estado para TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  late MaskTextInputFormatter textFieldMask5;
  String? Function(BuildContext, String?)? textController5Validator;
  // Campo(s) de estado para TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // Campo(s) de estado para TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // Campo(s) de estado para TextField widget.
  FocusNode? textFieldFocusNode8;
  TextEditingController? textFieldTextController;
  String? Function(BuildContext, String?)? textFieldTextControllerValidator;
  // Campo(s) de estado para TextFieldSenha widget.
  FocusNode? textFieldSenhaFocusNode;
  TextEditingController? textFieldSenhaTextController;
  late bool textFieldSenhaVisibility;
  String? Function(BuildContext, String?)?
      textFieldSenhaTextControllerValidator;
  String? _textFieldSenhaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Senha is required';
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }

    return null;
  }

  // Campo(s) de estado para TextField widget.
  FocusNode? textFieldFocusNode9;
  TextEditingController? textController10;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? textController10Validator;
  // Campo(s) de estado para Checkbox widget.
  bool? checkboxValue1;
  // Campo(s) de estado para Checkbox widget.
  bool? checkboxValue2;
  // Armazena o resultado da ação [Cloud Function - createPatientAccount] action in Button widget.
  CreatePatientAccountCloudFunctionCallResponse? cloudFunctionwx2;
  // Armazena o resultado da ação [Cloud Function - createPatientAccount] action in Button widget.
  CreatePatientAccountCloudFunctionCallResponse? cloudFunctionwx1;
  // Model for NoInternetPopuP component.
  late NoInternetPopuPModel noInternetPopuPModel;

  @override
  void initState(BuildContext context) {
    textFieldSenhaVisibility = false;
    textFieldSenhaTextControllerValidator =
        _textFieldSenhaTextControllerValidator;
    passwordVisibility = false;
    noInternetPopuPModel = createModel(context, () => NoInternetPopuPModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();

    textFieldFocusNode6?.dispose();
    textController6?.dispose();

    textFieldFocusNode7?.dispose();
    textController7?.dispose();

    textFieldFocusNode8?.dispose();
    textFieldTextController?.dispose();

    textFieldSenhaFocusNode?.dispose();
    textFieldSenhaTextController?.dispose();

    textFieldFocusNode9?.dispose();
    textController10?.dispose();

    noInternetPopuPModel.dispose();
  }
}
