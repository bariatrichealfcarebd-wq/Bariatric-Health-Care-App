import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/componentes/abas/datepicker_popover/datepicker_popover_widget.dart';
import '/componentes/abas/no_internet_popu_p/no_internet_popu_p_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';

// codigo gerado automaticamente pelo flutterflow: página da aplicação
import '/index.dart';
import 'suplementacao_cutanea_widget.dart' show SuplementacaoCutaneaWidget;
import 'package:flutter/material.dart';

class SuplementacaoCutaneaModel
    extends FlutterFlowModel<SuplementacaoCutaneaWidget> {
  // Campos de estado local para esta página.

  DateTime? dataSelecionada;

  SuplementacaoRecord? supatual;

  FFUploadedFile? ficheiroCarregado;

  // Campos de estado para os widgets desta página.

  // Armazena o resultado da ação [Custom Action - checkInternet] action in SuplementacaoCutanea widget.
  bool? temNet;
  // Armazena o resultado da ação [Backend Call - Read Document] action in SuplementacaoCutanea widget.
  PacienteRecord? pacienteData;
  // Armazena o resultado da ação [Firestore Query - Query a collection] action in SuplementacaoCutanea widget.
  SuplementacaoRecord? filtranutri;
  // Armazena o resultado da ação [Firestore Query - Query a collection] action in SuplementacaoCutanea widget.
  SuplementacaoRecord? filtropaciente;
  // Model for datepickerPopover component.
  late DatepickerPopoverModel datepickerPopoverModel;
  // Armazena o resultado da ação [Alert Dialog - Custom Dialog] action in datepickerPopover widget.
  DateTime? selectedDate;
  bool isDataUploading_uploadDataLd = false;
  FFUploadedFile uploadedLocalFile_uploadDataLd =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadDataP6v = false;
  FFUploadedFile uploadedLocalFile_uploadDataP6v =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataP6v = '';

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
    datepickerPopoverModel.dispose();
    noInternetPopuPModel.dispose();
  }
}
