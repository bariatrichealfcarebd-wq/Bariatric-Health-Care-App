import '/backend/backend.dart';
import '/componentes/abas/datepicker_popover/datepicker_popover_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'outra_suplementacoes_widget.dart' show OutraSuplementacoesWidget;
import 'package:flutter/material.dart';

class OutraSuplementacoesModel
    extends FlutterFlowModel<OutraSuplementacoesWidget> {
  ///  Local state fields for this page.

  DateTime? dia;

  OutrasSuplementacaoRecord? supatual;

  FFUploadedFile? ficharioCarregado;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in OutraSuplementacoes widget.
  PacienteRecord? pacienteData;
  // Stores action output result for [Firestore Query - Query a collection] action in OutraSuplementacoes widget.
  OutrasSuplementacaoRecord? filtrodanutri;
  // Stores action output result for [Firestore Query - Query a collection] action in OutraSuplementacoes widget.
  OutrasSuplementacaoRecord? filtropdaaciente;
  // State field(s) for nomeSup widget.
  FocusNode? nomeSupFocusNode;
  TextEditingController? nomeSupTextController;
  String? Function(BuildContext, String?)? nomeSupTextControllerValidator;
  // Model for datepickerPopover component.
  late DatepickerPopoverModel datepickerPopoverModel;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in datepickerPopover widget.
  DateTime? selectedDate;
  bool isDataUploading_uploadDataLd2 = false;
  FFUploadedFile uploadedLocalFile_uploadDataLd2 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  bool isDataUploading_uploadDataTp2 = false;
  FFUploadedFile uploadedLocalFile_uploadDataTp2 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataTp2 = '';

  @override
  void initState(BuildContext context) {
    datepickerPopoverModel =
        createModel(context, () => DatepickerPopoverModel());
  }

  @override
  void dispose() {
    nomeSupFocusNode?.dispose();
    nomeSupTextController?.dispose();

    datepickerPopoverModel.dispose();
  }
}
