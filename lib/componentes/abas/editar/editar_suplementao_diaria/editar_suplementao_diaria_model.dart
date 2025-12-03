import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'editar_suplementao_diaria_widget.dart'
    show EditarSuplementaoDiariaWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditarSuplementaoDiariaModel
    extends FlutterFlowModel<EditarSuplementaoDiariaWidget> {
  ///  Local state fields for this component.

  FFUploadedFile? ficheiroCarregado;

  DateTime? dataCarregada;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in EditarSuplementaoDiaria widget.
  SuplementacaodiariaRecord? dataDiaria;
  // State field(s) for Tipo widget.
  FocusNode? tipoFocusNode;
  TextEditingController? tipoTextController;
  String? Function(BuildContext, String?)? tipoTextControllerValidator;
  // State field(s) for dData widget.
  FocusNode? dDataFocusNode;
  TextEditingController? dDataTextController;
  late MaskTextInputFormatter dDataMask;
  String? Function(BuildContext, String?)? dDataTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for TextField widget.
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
