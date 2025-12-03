import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'editar_paciente_widget.dart' show EditarPacienteWidget;
import 'package:flutter/material.dart';

class EditarPacienteModel extends FlutterFlowModel<EditarPacienteWidget> {
  // Campos de estado local para este componente.

  DateTime? dataCarregada;

  // Campos de estado para os widgets deste componente.

  // Armazena o resultado da ação [Backend Call - Read Document] action in editarPaciente widget.
  PacienteRecord? dadosPaciente;
  // Campo(s) de estado para tipoOperacao widget.
  FocusNode? tipoOperacaoFocusNode;
  TextEditingController? tipoOperacaoTextController;
  String? Function(BuildContext, String?)? tipoOperacaoTextControllerValidator;
  // Campo(s) de estado para data widget.
  FocusNode? dataFocusNode;
  TextEditingController? dataTextController;
  String? Function(BuildContext, String?)? dataTextControllerValidator;
  DateTime? datePicked;
  // Campo(s) de estado para nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeTextController;
  String? Function(BuildContext, String?)? nomeTextControllerValidator;
  // Campo(s) de estado para email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // Armazena o resultado da ação [Cloud Function - updatePatientAccount] action in Button widget.
  UpdatePatientAccountCloudFunctionCallResponse? cloudFunctionblc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tipoOperacaoFocusNode?.dispose();
    tipoOperacaoTextController?.dispose();

    dataFocusNode?.dispose();
    dataTextController?.dispose();

    nomeFocusNode?.dispose();
    nomeTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
