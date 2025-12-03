import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'componente_calendario_widget.dart' show ComponenteCalendarioWidget;
import 'package:flutter/material.dart';

class ComponenteCalendarioModel
    extends FlutterFlowModel<ComponenteCalendarioWidget> {
  // Campos de estado local para este componente.

  FFUploadedFile? ficheiroCarregado;

  DateTime? dataCarregada;

  DateTime? horaCarregada;

  // Campos de estado para os widgets deste componente.

  // Armazena o resultado da ação [Backend Call - Read Document] action in ComponenteCalendario widget.
  AgendEventosRecord? agendadados;
  // Campo(s) de estado para Data widget.
  FocusNode? dataFocusNode;
  TextEditingController? dataTextController;
  String? Function(BuildContext, String?)? dataTextControllerValidator;
  DateTime? datePicked1;
  // Campo(s) de estado para Hora widget.
  FocusNode? horaFocusNode;
  TextEditingController? horaTextController;
  String? Function(BuildContext, String?)? horaTextControllerValidator;
  DateTime? datePicked2;
  // Campo(s) de estado para Descr widget.
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
