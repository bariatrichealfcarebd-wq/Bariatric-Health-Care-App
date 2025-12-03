import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'editar_suplemento_cutaneo_widget.dart'
    show EditarSuplementoCutaneoWidget;
import 'package:flutter/material.dart';

class EditarSuplementoCutaneoModel
    extends FlutterFlowModel<EditarSuplementoCutaneoWidget> {
  // Campos de estado local para este componente.

  FFUploadedFile? ficheiroCarregado;

  DateTime? dataCarregada;

  // Campos de estado para os widgets deste componente.

  // Armazena o resultado da ação [Backend Call - Read Document] action in EditarSuplementoCutaneo widget.
  SuplementacaoRecord? dataCut;
  // Campo(s) de estado para TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  DateTime? datePicked;
  // Campo(s) de estado para TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  bool isDataUploading_uploadDataCutaneaEditada = false;
  FFUploadedFile uploadedLocalFile_uploadDataCutaneaEditada =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadDataToFire1 = false;
  FFUploadedFile uploadedLocalFile_uploadDataToFire1 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataToFire1 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
