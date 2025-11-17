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

  /// Armazena referências aos sintomas selecionados pelo paciente.
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

  /// Registra as categorias de conteúdo que o usuário visitou.
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

  /// Nome do paciente atualmente em visualização ou pesquisa.
  String _nomePaciente = '';
  String get nomePaciente => _nomePaciente;
  set nomePaciente(String value) {
    _nomePaciente = value;
  }

  /// Referência ao documento do paciente que está sendo pesquisado.
  DocumentReference? _pacientePesquisa;
  DocumentReference? get pacientePesquisa => _pacientePesquisa;
  set pacientePesquisa(DocumentReference? value) {
    _pacientePesquisa = value;
  }

  /// Data selecionada em calendários ou filtros.
  DateTime? _dataSelecionada;
  DateTime? get dataSelecionada => _dataSelecionada;
  set dataSelecionada(DateTime? value) {
    _dataSelecionada = value;
  }

  /// Armazena a URL de um arquivo PDF gerado ou selecionado.
  String _pdfURL = '';
  String get pdfURL => _pdfURL;
  set pdfURL(String value) {
    _pdfURL = value;
  }

  /// Sinaliza se o usuário concordou com os parâmetros ou termos de uso.
  bool _concordaParam = false;
  bool get concordaParam => _concordaParam;
  set concordaParam(bool value) {
    _concordaParam = value;
  }

  /// Sinaliza se o usuário aceitou o termo de consentimento.
  bool _Termo = false;
  bool get Termo => _Termo;
  set Termo(bool value) {
    _Termo = value;
  }
}
