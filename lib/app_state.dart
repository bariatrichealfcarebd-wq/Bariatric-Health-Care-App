import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<DocumentReference> _sintomasSelecionados = [];
  List<DocumentReference> get sintomasSelecionados => _sintomasSelecionados;
  set sintomasSelecionados(List<DocumentReference> value) {
    _sintomasSelecionados = value;
  }

  void addToSintomasSelecionados(DocumentReference value) {
    sintomasSelecionados.add(value);
  }

  void removeFromSintomasSelecionados(DocumentReference value) {
    sintomasSelecionados.remove(value);
  }

  void removeAtIndexFromSintomasSelecionados(int index) {
    sintomasSelecionados.removeAt(index);
  }

  void updateSintomasSelecionadosAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    sintomasSelecionados[index] = updateFn(_sintomasSelecionados[index]);
  }

  void insertAtIndexInSintomasSelecionados(int index, DocumentReference value) {
    sintomasSelecionados.insert(index, value);
  }

  List<String> _categoriaVisitadas = [];
  List<String> get categoriaVisitadas => _categoriaVisitadas;
  set categoriaVisitadas(List<String> value) {
    _categoriaVisitadas = value;
  }

  void addToCategoriaVisitadas(String value) {
    categoriaVisitadas.add(value);
  }

  void removeFromCategoriaVisitadas(String value) {
    categoriaVisitadas.remove(value);
  }

  void removeAtIndexFromCategoriaVisitadas(int index) {
    categoriaVisitadas.removeAt(index);
  }

  void updateCategoriaVisitadasAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    categoriaVisitadas[index] = updateFn(_categoriaVisitadas[index]);
  }

  void insertAtIndexInCategoriaVisitadas(int index, String value) {
    categoriaVisitadas.insert(index, value);
  }

  String _nomePaciente = '';
  String get nomePaciente => _nomePaciente;
  set nomePaciente(String value) {
    _nomePaciente = value;
  }

  DocumentReference? _pacientePesquisa;
  DocumentReference? get pacientePesquisa => _pacientePesquisa;
  set pacientePesquisa(DocumentReference? value) {
    _pacientePesquisa = value;
  }

  DateTime? _dataSelecionada;
  DateTime? get dataSelecionada => _dataSelecionada;
  set dataSelecionada(DateTime? value) {
    _dataSelecionada = value;
  }

  /// vai guardar o link para o arquivo pdf
  String _pdfURL = '';
  String get pdfURL => _pdfURL;
  set pdfURL(String value) {
    _pdfURL = value;
  }

  bool _concordaParam = false;
  bool get concordaParam => _concordaParam;
  set concordaParam(bool value) {
    _concordaParam = value;
  }
}
