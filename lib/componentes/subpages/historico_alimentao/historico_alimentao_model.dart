import '/backend/backend.dart';
import '/componentes/abas/no_internet_popu_p/no_internet_popu_p_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';

// codigo gerado automaticamente pelo flutterflow: subpágina da aplicação
import '/index.dart';
import 'historico_alimentao_widget.dart' show HistoricoAlimentaoWidget;
import 'package:flutter/material.dart';

class HistoricoAlimentaoModel
    extends FlutterFlowModel<HistoricoAlimentaoWidget> {
  // Campos de estado local para esta página.

  List<dynamic> listaDePdfs = [];
  void addToListaDePdfs(dynamic item) => listaDePdfs.add(item);
  void removeFromListaDePdfs(dynamic item) => listaDePdfs.remove(item);
  void removeAtIndexFromListaDePdfs(int index) => listaDePdfs.removeAt(index);
  void insertAtIndexInListaDePdfs(int index, dynamic item) =>
      listaDePdfs.insert(index, item);
  void updateListaDePdfsAtIndex(int index, Function(dynamic) updateFn) =>
      listaDePdfs[index] = updateFn(listaDePdfs[index]);

  bool confirmar = false;

  DateTime? dataFiltrar;

  List<DocumentReference> listadePdfs = [];
  void addToListadePdfs(DocumentReference item) => listadePdfs.add(item);
  void removeFromListadePdfs(DocumentReference item) =>
      listadePdfs.remove(item);
  void removeAtIndexFromListadePdfs(int index) => listadePdfs.removeAt(index);
  void insertAtIndexInListadePdfs(int index, DocumentReference item) =>
      listadePdfs.insert(index, item);
  void updateListadePdfsAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      listadePdfs[index] = updateFn(listadePdfs[index]);

  DateTime? dataFim;

  // Campos de estado para os widgets desta página.

  // Armazena o resultado da ação [Custom Action - checkInternet] action in HistoricoAlimentao widget.
  bool? temNet;
  // Armazena o resultado da ação [Backend Call - Read Document] action in HistoricoAlimentao widget.
  PacienteRecord? pacienteData;
  // Armazena o resultado da ação [Firestore Query - Query a collection] action in HistoricoAlimentao widget.
  List<RelatoriosPdfRecord>? filtronutri;
  // Armazena o resultado da ação [Firestore Query - Query a collection] action in HistoricoAlimentao widget.
  List<RelatoriosPdfRecord>? filtroteste2;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Armazena o resultado da ação [Firestore Query - Query a collection] action in IconButton widget.
  List<RelatoriosPdfRecord>? filtroDataNutri;
  // Armazena o resultado da ação [Firestore Query - Query a collection] action in IconButton widget.
  List<RelatoriosPdfRecord>? filtropacienteData;
  // Armazena o resultado da ação [Firestore Query - Query a collection] action in Icon widget.
  List<RelatoriosPdfRecord>? filtronutri3;
  // Armazena o resultado da ação [Firestore Query - Query a collection] action in Icon widget.
  List<RelatoriosPdfRecord>? filtroteste3;
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
