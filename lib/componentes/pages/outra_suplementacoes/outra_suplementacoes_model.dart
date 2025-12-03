import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/componentes/abas/datepicker_popover/datepicker_popover_widget.dart';
import '/componentes/abas/no_internet_popu_p/no_internet_popu_p_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';

// codigo gerado automaticamente pelo flutterflow: página da aplicação
import '/index.dart';
import 'outra_suplementacoes_widget.dart' show OutraSuplementacoesWidget;
import 'package:flutter/material.dart';

class OutraSuplementacoesModel
    extends FlutterFlowModel<OutraSuplementacoesWidget> {
  // Campos de estado local para esta página.

  DateTime? dia;

  OutrasSuplementacaoRecord? supatual;

  FFUploadedFile? ficharioCarregado;

  // Campos de estado para os widgets desta página.

  // Armazena o resultado da ação [Custom Action - checkInternet] action in OutraSuplementacoes widget.
  bool? temNet;
  // Armazena o resultado da ação [Backend Call - Read Document] action in OutraSuplementacoes widget.
  PacienteRecord? pacienteData;
  // Armazena o resultado da ação [Firestore Query - Query a collection] action in OutraSuplementacoes widget.
  OutrasSuplementacaoRecord? filtronutri;
  // Armazena o resultado da ação [Firestore Query - Query a collection] action in OutraSuplementacoes widget.
  OutrasSuplementacaoRecord? filtropaciente;
  // Campo(s) de estado para nomeSup widget.
  FocusNode? nomeSupFocusNode;
  TextEditingController? nomeSupTextController;
  String? Function(BuildContext, String?)? nomeSupTextControllerValidator;
  // Model for datepickerPopover component.
  late DatepickerPopoverModel datepickerPopoverModel;
  // Armazena o resultado da ação [Alert Dialog - Custom Dialog] action in datepickerPopover widget.
  DateTime? selectedDate;
  bool isDataUploading_uploadDataLd2 = false;
  FFUploadedFile uploadedLocalFile_uploadDataLd2 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadDataTp2 = false;
  FFUploadedFile uploadedLocalFile_uploadDataTp2 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataTp2 = '';

  // Armazena o resultado da ação [Cloud Function - enviarNotificacaoGenerica] action in Button widget.
  EnviarNotificacaoGenericaCloudFunctionCallResponse? cloudFunctionj1a;
  // Model for NoInternetPopuP component.
  late NoInternetPopuPModel noInternetPopuPModel;

  @override
  void initState(BuildContext context) {
    datepickerPopoverModel =
        createModel(context, () => DatepickerPopoverModel());
    noInternetPopuPModel = createModel(context, () => NoInternetPopuPModel());
  }

  @override
  void dispose() {
    nomeSupFocusNode?.dispose();
    nomeSupTextController?.dispose();

    datepickerPopoverModel.dispose();
    noInternetPopuPModel.dispose();
  }
}
