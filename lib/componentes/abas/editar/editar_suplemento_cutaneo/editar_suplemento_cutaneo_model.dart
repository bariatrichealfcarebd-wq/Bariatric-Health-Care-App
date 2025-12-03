import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'editar_suplemento_cutaneo_widget.dart'
    show EditarSuplementoCutaneoWidget;
import 'package:flutter/material.dart';

class EditarSuplementoCutaneoModel
    extends FlutterFlowModel<EditarSuplementoCutaneoWidget> {
  ///  Local state fields for this component.

  FFUploadedFile? ficheiroCarregado;

  DateTime? dataCarregada;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in EditarSuplementoCutaneo widget.
  SuplementacaoRecord? dataCut;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  DateTime? datePicked;
  // State field(s) for TextField widget.
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
