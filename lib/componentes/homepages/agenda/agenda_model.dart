import '/componentes/abas/no_internet_popu_p/no_internet_popu_p_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';

// codigo gerado automaticamente pelo flutterflow: página inicial
import '/index.dart';
import 'agenda_widget.dart' show AgendaWidget;
import 'package:flutter/material.dart';

class AgendaModel extends FlutterFlowModel<AgendaWidget> {
  // Campos de estado local para esta página.

  List<DocumentReference> dataConsulta = [];
  void addToDataConsulta(DocumentReference item) => dataConsulta.add(item);
  void removeFromDataConsulta(DocumentReference item) =>
      dataConsulta.remove(item);
  void removeAtIndexFromDataConsulta(int index) => dataConsulta.removeAt(index);
  void insertAtIndexInDataConsulta(int index, DocumentReference item) =>
      dataConsulta.insert(index, item);
  void updateDataConsultaAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      dataConsulta[index] = updateFn(dataConsulta[index]);

  // Campos de estado para os widgets desta página.

  // Armazena o resultado da ação [Custom Action - checkInternet] action in agenda widget.
  bool? temNet;
  // Model for NoInternetPopuP component.
  late NoInternetPopuPModel noInternetPopuPModel;

  @override
  void initState(BuildContext context) {
    noInternetPopuPModel = createModel(context, () => NoInternetPopuPModel());
  }

  @override
  void dispose() {
    noInternetPopuPModel.dispose();
  }
}
