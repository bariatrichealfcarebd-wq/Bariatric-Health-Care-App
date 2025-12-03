import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'editar_suplementao_diaria_widget.dart'
    show EditarSuplementaoDiariaWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditarSuplementaoDiariaModel
    extends FlutterFlowModel<EditarSuplementaoDiariaWidget> {
  // Campos de estado local para este componente.

  FFUploadedFile? ficheiroCarregado;

  DateTime? dataCarregada;

  // Campos de estado para os widgets deste componente.

  // Armazena o resultado da ação [Backend Call - Read Document] action in EditarSuplementaoDiaria widget.
  SuplementacaodiariaRecord? dataDiaria;
  // Campo(s) de estado para Tipo widget.
  FocusNode? tipoFocusNode;
  TextEditingController? tipoTextController;
  String? Function(BuildContext, String?)? tipoTextControllerValidator;
  // Campo(s) de estado para dData widget.
  FocusNode? dDataFocusNode;
  TextEditingController? dDataTextController;
  late MaskTextInputFormatter dDataMask;
  String? Function(BuildContext, String?)? dDataTextControllerValidator;
  DateTime? datePicked;
  // Campo(s) de estado para TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  bool isDataUploading_uploadDataEditada = false;
  FFUploadedFile uploadedLocalFile_uploadDataEditada =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadDataToFire = false;
  FFUploadedFile uploadedLocalFile_uploadDataToFire =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataToFire = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tipoFocusNode?.dispose();
    tipoTextController?.dispose();

    dDataFocusNode?.dispose();
    dDataTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController3?.dispose();
  }
}
