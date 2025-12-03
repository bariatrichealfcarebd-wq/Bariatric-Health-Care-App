import '/backend/backend.dart';
import '/componentes/abas/no_internet_popu_p/no_internet_popu_p_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';

// codigo gerado automaticamente pelo flutterflow: subpágina da aplicação
import '/index.dart';
import 'historico_widget.dart' show HistoricoWidget;
import 'package:flutter/material.dart';

class HistoricoModel extends FlutterFlowModel<HistoricoWidget> {
  // Campos de estado local para esta página.

  bool confirmar = false;

  DateTime? dataFiltrar;

  List<DocumentReference> relatoriosList = [];
  void addToRelatoriosList(DocumentReference item) => relatoriosList.add(item);
  void removeFromRelatoriosList(DocumentReference item) =>
      relatoriosList.remove(item);
  void removeAtIndexFromRelatoriosList(int index) =>
      relatoriosList.removeAt(index);
  void insertAtIndexInRelatoriosList(int index, DocumentReference item) =>
      relatoriosList.insert(index, item);
  void updateRelatoriosListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      relatoriosList[index] = updateFn(relatoriosList[index]);

  DateTime? dataFim;

  // Campos de estado para os widgets desta página.

  // Armazena o resultado da ação [Custom Action - checkInternet] action in Historico widget.
  bool? temNet;
  // Armazena o resultado da ação [Backend Call - Read Document] action in Historico widget.
  PacienteRecord? pacienteData;
  // Armazena o resultado da ação [Firestore Query - Query a collection] action in Historico widget.
  List<RelatoriosQuestionarioRecord>? filtrodaNutri;
  // Armazena o resultado da ação [Firestore Query - Query a collection] action in Historico widget.
  List<RelatoriosQuestionarioRecord>? filtroteste;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Armazena o resultado da ação [Firestore Query - Query a collection] action in IconButton widget.
  List<RelatoriosQuestionarioRecord>? filtroDataNutri;
  // Armazena o resultado da ação [Firestore Query - Query a collection] action in IconButton widget.
  List<RelatoriosQuestionarioRecord>? filtropacienteData;
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
