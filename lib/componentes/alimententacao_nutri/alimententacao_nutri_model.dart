import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'alimententacao_nutri_widget.dart' show AlimententacaoNutriWidget;
import 'package:flutter/material.dart';

class AlimententacaoNutriModel
    extends FlutterFlowModel<AlimententacaoNutriWidget> {
  ///  Local state fields for this page.

  List<String> arquivoParaEnviar = [];
  void addToArquivoParaEnviar(String item) => arquivoParaEnviar.add(item);
  void removeFromArquivoParaEnviar(String item) =>
      arquivoParaEnviar.remove(item);
  void removeAtIndexFromArquivoParaEnviar(int index) =>
      arquivoParaEnviar.removeAt(index);
  void insertAtIndexInArquivoParaEnviar(int index, String item) =>
      arquivoParaEnviar.insert(index, item);
  void updateArquivoParaEnviarAtIndex(int index, Function(String) updateFn) =>
      arquivoParaEnviar[index] = updateFn(arquivoParaEnviar[index]);

  DocumentReference? pacientePesquisa;

  FFUploadedFile? ficheiroCarregado;

  String? nomeDoArquivo;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in AlimententacaoNutri widget.
  PacienteRecord? pacienteData;
  bool isDataUploading_uploadDataLd1 = false;
  FFUploadedFile uploadedLocalFile_uploadDataLd1 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Bottom Sheet - pdfChange] action in Container widget.
  String? arquivoNome;
  bool isDataUploading_uploadDataTp5 = false;
  FFUploadedFile uploadedLocalFile_uploadDataTp5 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataTp5 = '';

  // Stores action output result for [Cloud Function - enviarNotificacaoGenerica] action in Button widget.
  EnviarNotificacaoGenericaCloudFunctionCallResponse? cloudFunctionj1a;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
