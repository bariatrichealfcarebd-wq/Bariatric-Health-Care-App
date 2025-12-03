import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';

// codigo gerado automaticamente pelo flutterflow: componente de interface do usuário
import 'item_sintoma_widget.dart' show ItemSintomaWidget;
import 'package:flutter/material.dart';

class ItemSintomaModel extends FlutterFlowModel<ItemSintomaWidget> {
  // Campos de estado local para este componente.

  bool ativo = false;

  LigacaoSintomaRecord? referenciaLigacao;

  // Campos de estado para os widgets deste componente.

  // Armazena o resultado da ação [Firestore Query - Query a collection] action in ItemSintoma widget.
  LigacaoSintomaRecord? vereficarIn;
  // Armazena o resultado da ação [Firestore Query - Query a collection] action in Container widget.
  LigacaoSintomaRecord? vereficar;
  // Armazena o resultado da ação [Backend Call - Create Document] action in Container widget.
  LigacaoSintomaRecord? docCriado;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
