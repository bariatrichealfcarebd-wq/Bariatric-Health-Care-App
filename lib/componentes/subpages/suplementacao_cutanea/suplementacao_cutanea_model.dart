import '/backend/backend.dart';
import '/componentes/abas/datepicker_popover/datepicker_popover_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'suplementacao_cutanea_widget.dart' show SuplementacaoCutaneaWidget;
import 'package:flutter/material.dart';

class SuplementacaoCutaneaModel
    extends FlutterFlowModel<SuplementacaoCutaneaWidget> {
  ///  Local state fields for this page.

  DateTime? dia;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in SuplementacaoCutanea widget.
  PacienteRecord? pacienteData;
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
    doseRecomendadaFocusNode?.dispose();
    doseRecomendadaTextController?.dispose();

    datepickerPopoverModel.dispose();
  }
}
