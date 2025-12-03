import '/backend/backend.dart';
import '/componentes/abas/no_internet_popu_p/no_internet_popu_p_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'historico_sup_widget.dart' show HistoricoSupWidget;
import 'package:flutter/material.dart';

class HistoricoSupModel extends FlutterFlowModel<HistoricoSupWidget> {
  ///  Local state fields for this page.

  DocumentReference? pacienteData;

  List<DocumentReference> listaSupDiaria = [];
  void addToListaSupDiaria(DocumentReference item) => listaSupDiaria.add(item);
  void removeFromListaSupDiaria(DocumentReference item) =>
      listaSupDiaria.remove(item);
  void removeAtIndexFromListaSupDiaria(int index) =>
      listaSupDiaria.removeAt(index);
  void insertAtIndexInListaSupDiaria(int index, DocumentReference item) =>
      listaSupDiaria.insert(index, item);
  void updateListaSupDiariaAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      listaSupDiaria[index] = updateFn(listaSupDiaria[index]);

  List<DocumentReference> listaSupCutanea = [];
  void addToListaSupCutanea(DocumentReference item) =>
      listaSupCutanea.add(item);
  void removeFromListaSupCutanea(DocumentReference item) =>
      listaSupCutanea.remove(item);
  void removeAtIndexFromListaSupCutanea(int index) =>
      listaSupCutanea.removeAt(index);
  void insertAtIndexInListaSupCutanea(int index, DocumentReference item) =>
      listaSupCutanea.insert(index, item);
  void updateListaSupCutaneaAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      listaSupCutanea[index] = updateFn(listaSupCutanea[index]);

  List<DocumentReference> listaSupOutros = [];
  void addToListaSupOutros(DocumentReference item) => listaSupOutros.add(item);
  void removeFromListaSupOutros(DocumentReference item) =>
      listaSupOutros.remove(item);
  void removeAtIndexFromListaSupOutros(int index) =>
      listaSupOutros.removeAt(index);
  void insertAtIndexInListaSupOutros(int index, DocumentReference item) =>
      listaSupOutros.insert(index, item);
  void updateListaSupOutrosAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      listaSupOutros[index] = updateFn(listaSupOutros[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkInternet] action in HistoricoSup widget.
  bool? temNet;
  // Stores action output result for [Backend Call - Read Document] action in HistoricoSup widget.
  PacienteRecord? pacienteDat;
  // Stores action output result for [Firestore Query - Query a collection] action in HistoricoSup widget.
  List<SuplementacaodiariaRecord>? filtroNutriDiario;
  // Stores action output result for [Firestore Query - Query a collection] action in HistoricoSup widget.
  List<SuplementacaodiariaRecord>? filtroPacienteDiario;
  // Stores action output result for [Firestore Query - Query a collection] action in HistoricoSup widget.
  List<SuplementacaodiariaRecord>? filtroPaciente;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Firestore Query - Query a collection] action in Tab widget.
  List<SuplementacaoRecord>? filtroNutricutanea;
  // Stores action output result for [Firestore Query - Query a collection] action in Tab widget.
  List<SuplementacaoRecord>? filtroPacientecutanea;
  // Stores action output result for [Firestore Query - Query a collection] action in Tab widget.
  List<OutrasSuplementacaoRecord>? filtroNutriOutras;
  // Stores action output result for [Firestore Query - Query a collection] action in Tab widget.
  List<OutrasSuplementacaoRecord>? filtroPacienteOutras;
  // Model for NoInternetPopuP component.
  late NoInternetPopuPModel noInternetPopuPModel;

  @override
  void initState(BuildContext context) {
    noInternetPopuPModel = createModel(context, () => NoInternetPopuPModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    noInternetPopuPModel.dispose();
  }
}
