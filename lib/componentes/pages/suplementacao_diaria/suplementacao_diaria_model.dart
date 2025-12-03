import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/componentes/abas/no_internet_popu_p/no_internet_popu_p_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';

// codigo gerado automaticamente pelo flutterflow: página da aplicação
import '/index.dart';
import 'suplementacao_diaria_widget.dart' show SuplementacaoDiariaWidget;
import 'package:flutter/material.dart';

class SuplementacaoDiariaModel
    extends FlutterFlowModel<SuplementacaoDiariaWidget> {
  // Campos de estado local para esta página.

  SuplementacaodiariaRecord? supdiaria;

  String? pacientaData;

  FFUploadedFile? ficheiroCarregado;

  // Campos de estado para os widgets desta página.

  // Armazena o resultado da ação [Custom Action - checkInternet] action in SuplementacaoDiaria widget.
  bool? temNet;
  // Armazena o resultado da ação [Backend Call - Read Document] action in SuplementacaoDiaria widget.
  PacienteRecord? pacienteData;
  // Armazena o resultado da ação [Firestore Query - Query a collection] action in SuplementacaoDiaria widget.
  SuplementacaodiariaRecord? filtrodanutri;
  // Armazena o resultado da ação [Firestore Query - Query a collection] action in SuplementacaoDiaria widget.
  SuplementacaodiariaRecord? filtrodopaciente;
  // Campo(s) de estado para TipoDeSuplemento widget.
  final tipoDeSuplementoKey = GlobalKey();
  FocusNode? tipoDeSuplementoFocusNode;
  TextEditingController? tipoDeSuplementoTextController;
  String? tipoDeSuplementoSelectedOption;
  String? Function(BuildContext, String?)?
      tipoDeSuplementoTextControllerValidator;
  // Campo(s) de estado para TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  DateTime? datePicked;
  bool isDataUploading_uploadDataLd4 = false;
  FFUploadedFile uploadedLocalFile_uploadDataLd4 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadData0zh = false;
  FFUploadedFile uploadedLocalFile_uploadData0zh =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData0zh = '';

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
    tipoDeSuplementoFocusNode?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();

    noInternetPopuPModel.dispose();
  }
}
