import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/componentes/abas/datepicker_popover/datepicker_popover_widget.dart';
import '/componentes/abas/no_internet_popu_p/no_internet_popu_p_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'suplementacao_cutanea_widget.dart' show SuplementacaoCutaneaWidget;
import 'package:flutter/material.dart';

class SuplementacaoCutaneaModel
    extends FlutterFlowModel<SuplementacaoCutaneaWidget> {
  ///  Local state fields for this page.

  DateTime? dataSelecionada;

  SuplementacaoRecord? supatual;

  FFUploadedFile? ficheiroCarregado;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkInternet] action in SuplementacaoCutanea widget.
  bool? temNet;
  // Stores action output result for [Backend Call - Read Document] action in SuplementacaoCutanea widget.
  PacienteRecord? pacienteData;
  // Stores action output result for [Firestore Query - Query a collection] action in SuplementacaoCutanea widget.
  SuplementacaoRecord? filtranutri;
  // Stores action output result for [Firestore Query - Query a collection] action in SuplementacaoCutanea widget.
  SuplementacaoRecord? filtropaciente;
  // Model for datepickerPopover component.
  late DatepickerPopoverModel datepickerPopoverModel;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in datepickerPopover widget.
  DateTime? selectedDate;
  bool isDataUploading_uploadDataLd = false;
  FFUploadedFile uploadedLocalFile_uploadDataLd =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadDataP6v = false;
  FFUploadedFile uploadedLocalFile_uploadDataP6v =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataP6v = '';

  // Stores action output result for [Cloud Function - enviarNotificacaoGenerica] action in Button widget.
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
