import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'item_sintoma_widget.dart' show ItemSintomaWidget;
import 'package:flutter/material.dart';

class ItemSintomaModel extends FlutterFlowModel<ItemSintomaWidget> {
  ///  Local state fields for this component.

  bool ativo = false;

  LigacaoSintomaRecord? referenciaLigacao;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in ItemSintoma widget.
  LigacaoSintomaRecord? vereficarIn;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  LigacaoSintomaRecord? vereficar;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  LigacaoSintomaRecord? docCriado;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
