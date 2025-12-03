import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'componente_calendario_widget.dart' show ComponenteCalendarioWidget;
import 'package:flutter/material.dart';

class ComponenteCalendarioModel
    extends FlutterFlowModel<ComponenteCalendarioWidget> {
  ///  Local state fields for this component.

  FFUploadedFile? ficheiroCarregado;

  DateTime? dataCarregada;

  DateTime? horaCarregada;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in ComponenteCalendario widget.
  AgendEventosRecord? agendadados;
  // State field(s) for Data widget.
  FocusNode? dataFocusNode;
  TextEditingController? dataTextController;
  String? Function(BuildContext, String?)? dataTextControllerValidator;
  DateTime? datePicked1;
  // State field(s) for Hora widget.
  FocusNode? horaFocusNode;
  TextEditingController? horaTextController;
  String? Function(BuildContext, String?)? horaTextControllerValidator;
  DateTime? datePicked2;
  // State field(s) for Descr widget.
  FocusNode? descrFocusNode;
  TextEditingController? descrTextController;
  String? Function(BuildContext, String?)? descrTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    dataFocusNode?.dispose();
    dataTextController?.dispose();

    horaFocusNode?.dispose();
    horaTextController?.dispose();

    descrFocusNode?.dispose();
    descrTextController?.dispose();
  }
}
