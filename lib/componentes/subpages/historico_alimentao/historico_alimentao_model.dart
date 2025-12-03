import '/backend/backend.dart';
import '/componentes/abas/no_internet_popu_p/no_internet_popu_p_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'historico_alimentao_widget.dart' show HistoricoAlimentaoWidget;
import 'package:flutter/material.dart';

class HistoricoAlimentaoModel
    extends FlutterFlowModel<HistoricoAlimentaoWidget> {
  ///  Local state fields for this page.

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

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkInternet] action in HistoricoAlimentao widget.
  bool? temNet;
  // Stores action output result for [Backend Call - Read Document] action in HistoricoAlimentao widget.
  PacienteRecord? pacienteData;
  // Stores action output result for [Firestore Query - Query a collection] action in HistoricoAlimentao widget.
  List<RelatoriosPdfRecord>? filtronutri;
  // Stores action output result for [Firestore Query - Query a collection] action in HistoricoAlimentao widget.
  List<RelatoriosPdfRecord>? filtroteste2;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<RelatoriosPdfRecord>? filtroDataNutri;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<RelatoriosPdfRecord>? filtropacienteData;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<RelatoriosPdfRecord>? filtronutri3;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
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
