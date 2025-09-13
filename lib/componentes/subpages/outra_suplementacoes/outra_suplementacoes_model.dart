import '/backend/backend.dart';
import '/componentes/abas/datepicker_popover/datepicker_popover_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'outra_suplementacoes_widget.dart' show OutraSuplementacoesWidget;
import 'package:flutter/material.dart';

class OutraSuplementacoesModel
    extends FlutterFlowModel<OutraSuplementacoesWidget> {
  ///  Local state fields for this page.

  DateTime? dia;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in OutraSuplementacoes widget.
  PacienteRecord? pacienteData;
  // State field(s) for NomedoSuplemento widget.
  FocusNode? nomedoSuplementoFocusNode;
  TextEditingController? nomedoSuplementoTextController;
  String? Function(BuildContext, String?)?
      nomedoSuplementoTextControllerValidator;
  // State field(s) for DoseRecomendada widget.
  FocusNode? doseRecomendadaFocusNode;
  TextEditingController? doseRecomendadaTextController;
  String? Function(BuildContext, String?)?
      doseRecomendadaTextControllerValidator;
  // Model for datepickerPopover component.
  late DatepickerPopoverModel datepickerPopoverModel;

  @override
  void initState(BuildContext context) {
    datepickerPopoverModel =
        createModel(context, () => DatepickerPopoverModel());
  }

  @override
  void dispose() {
    nomedoSuplementoFocusNode?.dispose();
    nomedoSuplementoTextController?.dispose();

    doseRecomendadaFocusNode?.dispose();
    doseRecomendadaTextController?.dispose();

    datepickerPopoverModel.dispose();
  }
}
