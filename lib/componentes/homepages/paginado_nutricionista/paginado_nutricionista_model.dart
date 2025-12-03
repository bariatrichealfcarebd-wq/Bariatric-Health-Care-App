import '/backend/backend.dart';
import '/componentes/abas/no_internet_popu_p/no_internet_popu_p_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'paginado_nutricionista_widget.dart' show PaginadoNutricionistaWidget;
import 'package:flutter/material.dart';

class PaginadoNutricionistaModel
    extends FlutterFlowModel<PaginadoNutricionistaWidget> {
  ///  Local state fields for this page.

  String nomePaciente = 'Aguardando paciente...';

  String? searchText;

  List<DocumentReference> pacienteResultados = [];
  void addToPacienteResultados(DocumentReference item) =>
      pacienteResultados.add(item);
  void removeFromPacienteResultados(DocumentReference item) =>
      pacienteResultados.remove(item);
  void removeAtIndexFromPacienteResultados(int index) =>
      pacienteResultados.removeAt(index);
  void insertAtIndexInPacienteResultados(int index, DocumentReference item) =>
      pacienteResultados.insert(index, item);
  void updatePacienteResultadosAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      pacienteResultados[index] = updateFn(pacienteResultados[index]);

  DocumentReference? pacienteTemp;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkInternet] action in PaginadoNutricionista widget.
  bool? temNet;
  // State field(s) for campoCPF widget.
  final campoCPFKey = GlobalKey();
  FocusNode? campoCPFFocusNode;
  TextEditingController? campoCPFTextController;
  String? campoCPFSelectedOption;
  String? Function(BuildContext, String?)? campoCPFTextControllerValidator;
  // Stores action output result for [Custom Action - buscarPacientesDoNutri] action in campoCPF widget.
  List<DocumentReference>? refsPacientesDaBusca;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  PacienteRecord? pacienteData;
  // Model for NoInternetPopuP component.
  late NoInternetPopuPModel noInternetPopuPModel;

  @override
  void initState(BuildContext context) {
    noInternetPopuPModel = createModel(context, () => NoInternetPopuPModel());
  }

  @override
  void dispose() {
    campoCPFFocusNode?.dispose();

    noInternetPopuPModel.dispose();
  }
}
