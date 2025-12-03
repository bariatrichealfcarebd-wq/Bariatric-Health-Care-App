import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'editar_paciente_widget.dart' show EditarPacienteWidget;
import 'package:flutter/material.dart';

class EditarPacienteModel extends FlutterFlowModel<EditarPacienteWidget> {
  ///  Local state fields for this component.

  DateTime? dataCarregada;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in editarPaciente widget.
  PacienteRecord? dadosPaciente;
  // State field(s) for tipoOperacao widget.
  FocusNode? tipoOperacaoFocusNode;
  TextEditingController? tipoOperacaoTextController;
  String? Function(BuildContext, String?)? tipoOperacaoTextControllerValidator;
  // State field(s) for data widget.
  FocusNode? dataFocusNode;
  TextEditingController? dataTextController;
  String? Function(BuildContext, String?)? dataTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeTextController;
  String? Function(BuildContext, String?)? nomeTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // Stores action output result for [Cloud Function - updatePatientAccount] action in Button widget.
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
