import '/componentes/abas/item_sintoma/item_sintoma_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'alimentacao_widget.dart' show AlimentacaoWidget;
import 'package:flutter/material.dart';

class AlimentacaoModel extends FlutterFlowModel<AlimentacaoWidget> {
  ///  Local state fields for this component.

  bool? ativo = false;

  List<DocumentReference> adicionar = [];
  void addToAdicionar(DocumentReference item) => adicionar.add(item);
  void removeFromAdicionar(DocumentReference item) => adicionar.remove(item);
  void removeAtIndexFromAdicionar(int index) => adicionar.removeAt(index);
  void insertAtIndexInAdicionar(int index, DocumentReference item) =>
      adicionar.insert(index, item);
  void updateAdicionarAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      adicionar[index] = updateFn(adicionar[index]);

  DocumentReference? referenciaLigacao;

  ///  State fields for stateful widgets in this component.

  // Models for ItemSintoma dynamic component.
  late FlutterFlowDynamicModels<ItemSintomaModel> itemSintomaModels;

  @override
  void initState(BuildContext context) {
    itemSintomaModels = FlutterFlowDynamicModels(() => ItemSintomaModel());
  }

  @override
  void dispose() {
    itemSintomaModels.dispose();
  }
}
