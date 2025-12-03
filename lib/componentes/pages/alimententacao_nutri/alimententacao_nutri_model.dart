import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/componentes/abas/no_internet_popu_p/no_internet_popu_p_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';

// codigo gerado automaticamente pelo flutterflow: página da aplicação
import '/index.dart';
import 'alimententacao_nutri_widget.dart' show AlimententacaoNutriWidget;
import 'package:flutter/material.dart';

class AlimententacaoNutriModel
    extends FlutterFlowModel<AlimententacaoNutriWidget> {
  // Campos de estado local para esta página.

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

  // Campos de estado para os widgets desta página.

  // Armazena o resultado da ação [Custom Action - checkInternet] action in AlimententacaoNutri widget.
  bool? temNet;
  // Armazena o resultado da ação [Backend Call - Read Document] action in AlimententacaoNutri widget.
  PacienteRecord? pacienteData;
  bool isDataUploading_uploadDataLd1 = false;
  FFUploadedFile uploadedLocalFile_uploadDataLd1 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Armazena o resultado da ação [Bottom Sheet - pdfChange] action in Container widget.
  String? arquivoNome;
  bool isDataUploading_uploadDataTp5 = false;
  FFUploadedFile uploadedLocalFile_uploadDataTp5 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataTp5 = '';

  // Armazena o resultado da ação [Cloud Function - enviarNotificacaoGenerica] action in Button widget.
  EnviarNotificacaoGenericaCloudFunctionCallResponse? cloudFunctionj1a;
  // Model for NoInternetPopuP component.
  late NoInternetPopuPModel noInternetPopuPModel;

  @override
  void initState(BuildContext context) {
    noInternetPopuPModel = createModel(context, () => NoInternetPopuPModel());
  }

  @override
  void dispose() {
    noInternetPopuPModel.dispose();
  }
}
