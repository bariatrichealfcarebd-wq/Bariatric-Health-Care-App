import '/backend/backend.dart';
import '/componentes/abas/datepicker_popover/datepicker_popover_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'suplementacao_cutanea_widget.dart' show SuplementacaoCutaneaWidget;
import 'package:flutter/material.dart';

class SuplementacaoCutaneaModel
    extends FlutterFlowModel<SuplementacaoCutaneaWidget> {
  ///  Local state fields for this page.

  DateTime? dataSelecionada;

  SuplementacaoRecord? supatual;

  FFUploadedFile? ficheiroCarregado;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in SuplementacaoCutanea widget.
  PacienteRecord? pacienteData;
  // Stores action output result for [Firestore Query - Query a collection] action in SuplementacaoCutanea widget.
  SuplementacaoRecord? filtrodanutri;
  // Stores action output result for [Firestore Query - Query a collection] action in SuplementacaoCutanea widget.
  SuplementacaoRecord? filtrodapaciente;
  // Model for datepickerPopover component.
  late DatepickerPopoverModel datepickerPopoverModel;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in datepickerPopover widget.
  DateTime? selectedDate;
  bool isDataUploading_uploadDataLd3 = false;
  FFUploadedFile uploadedLocalFile_uploadDataLd3 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadDataP6v = false;
  FFUploadedFile uploadedLocalFile_uploadDataP6v =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataP6v = '';

  @override
  void initState(BuildContext context) {
    datepickerPopoverModel =
        createModel(context, () => DatepickerPopoverModel());
  }

  @override
  void dispose() {
    datepickerPopoverModel.dispose();
  }
}
