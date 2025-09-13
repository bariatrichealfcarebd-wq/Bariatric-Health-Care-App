import '/flutter_flow/flutter_flow_util.dart';
import 'relatorio_alimentacao_widget.dart' show RelatorioAlimentacaoWidget;
import 'package:flutter/material.dart';

class RelatorioAlimentacaoModel
    extends FlutterFlowModel<RelatorioAlimentacaoWidget> {
  ///  Local state fields for this page.

  List<dynamic> listaDePdfs = [];
  void addToListaDePdfs(dynamic item) => listaDePdfs.add(item);
  void removeFromListaDePdfs(dynamic item) => listaDePdfs.remove(item);
  void removeAtIndexFromListaDePdfs(int index) => listaDePdfs.removeAt(index);
  void insertAtIndexInListaDePdfs(int index, dynamic item) =>
      listaDePdfs.insert(index, item);
  void updateListaDePdfsAtIndex(int index, Function(dynamic) updateFn) =>
      listaDePdfs[index] = updateFn(listaDePdfs[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
