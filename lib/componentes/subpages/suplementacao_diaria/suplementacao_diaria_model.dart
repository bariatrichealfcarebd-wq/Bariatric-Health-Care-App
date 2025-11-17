import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'suplementacao_diaria_widget.dart' show SuplementacaoDiariaWidget;
import 'package:flutter/material.dart';

class SuplementacaoDiariaModel
    extends FlutterFlowModel<SuplementacaoDiariaWidget> {
  ///  Local state fields for this page.

  SuplementacaodiariaRecord? supdiaria;

  DocumentReference? pacientaData;

  FFUploadedFile? ficheiroCarregado;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in SuplementacaoDiaria widget.
  PacienteRecord? pacienteData;
  // Stores action output result for [Firestore Query - Query a collection] action in SuplementacaoDiaria widget.
  SuplementacaodiariaRecord? filtronutri;
  // Stores action output result for [Firestore Query - Query a collection] action in SuplementacaoDiaria widget.
  SuplementacaodiariaRecord? filtropaciente;
  // State field(s) for TipoDeSuplemento widget.
  final tipoDeSuplementoKey = GlobalKey();
  FocusNode? tipoDeSuplementoFocusNode;
  TextEditingController? tipoDeSuplementoTextController;
  String? tipoDeSuplementoSelectedOption;
  String? Function(BuildContext, String?)?
      tipoDeSuplementoTextControllerValidator;
  bool isDataUploading_uploadDataLd4 = false;
  FFUploadedFile uploadedLocalFile_uploadDataLd4 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadData0zh = false;
  FFUploadedFile uploadedLocalFile_uploadData0zh =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData0zh = '';

  // Stores action output result for [Cloud Function - enviarNotificacaoGenerica] action in Button widget.
  EnviarNotificacaoGenericaCloudFunctionCallResponse? cloudFunctionj1a;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tipoDeSuplementoFocusNode?.dispose();
  }
}
