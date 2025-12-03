import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'editar_outros_suplementos_widget.dart'
    show EditarOutrosSuplementosWidget;
import 'package:flutter/material.dart';

class EditarOutrosSuplementosModel
    extends FlutterFlowModel<EditarOutrosSuplementosWidget> {
  ///  Local state fields for this component.

  FFUploadedFile? ficheiroCarregado;

  DateTime? dataCarregada;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in EditarOutrosSuplementos widget.
  OutrasSuplementacaoRecord? dataOutras;
  // State field(s) for Tipo widget.
  FocusNode? tipoFocusNode;
  TextEditingController? tipoTextController;
  String? Function(BuildContext, String?)? tipoTextControllerValidator;
  // State field(s) for Data widget.
  FocusNode? dataFocusNode;
  TextEditingController? dataTextController;
  String? Function(BuildContext, String?)? dataTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for TextField widget.
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
