import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'editar_outros_suplementos_widget.dart'
    show EditarOutrosSuplementosWidget;
import 'package:flutter/material.dart';

class EditarOutrosSuplementosModel
    extends FlutterFlowModel<EditarOutrosSuplementosWidget> {
  // Campos de estado local para este componente.

  FFUploadedFile? ficheiroCarregado;

  DateTime? dataCarregada;

  // Campos de estado para os widgets deste componente.

  // Armazena o resultado da ação [Backend Call - Read Document] action in EditarOutrosSuplementos widget.
  OutrasSuplementacaoRecord? dataOutras;
  // Campo(s) de estado para Tipo widget.
  FocusNode? tipoFocusNode;
  TextEditingController? tipoTextController;
  String? Function(BuildContext, String?)? tipoTextControllerValidator;
  // Campo(s) de estado para Data widget.
  FocusNode? dataFocusNode;
  TextEditingController? dataTextController;
  String? Function(BuildContext, String?)? dataTextControllerValidator;
  DateTime? datePicked;
  // Campo(s) de estado para TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  bool isDataUploading_uploadDataOutrasSUPEditar = false;
  FFUploadedFile uploadedLocalFile_uploadDataOutrasSUPEditar =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadDataToFire2 = false;
  FFUploadedFile uploadedLocalFile_uploadDataToFire2 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataToFire2 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tipoFocusNode?.dispose();
    tipoTextController?.dispose();

    dataFocusNode?.dispose();
    dataTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController3?.dispose();
  }
}
