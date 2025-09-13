import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
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

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _admPerm = await secureStorage.getBool('ff_admPerm') ?? _admPerm;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

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

  bool _admPerm = false;
  bool get admPerm => _admPerm;
  set admPerm(bool value) {
    _admPerm = value;
    secureStorage.setBool('ff_admPerm', value);
  }

  void deleteAdmPerm() {
    secureStorage.delete(key: 'ff_admPerm');
  }

  DocumentReference? _pacientePesquisa;
  DocumentReference? get pacientePesquisa => _pacientePesquisa;
  set pacientePesquisa(DocumentReference? value) {
    _pacientePesquisa = value;
  }

  List<DateTime> _DataSelecionada = [];
  List<DateTime> get DataSelecionada => _DataSelecionada;
  set DataSelecionada(List<DateTime> value) {
    _DataSelecionada = value;
  }

  void addToDataSelecionada(DateTime value) {
    DataSelecionada.add(value);
  }

  void removeFromDataSelecionada(DateTime value) {
    DataSelecionada.remove(value);
  }

  void removeAtIndexFromDataSelecionada(int index) {
    DataSelecionada.removeAt(index);
  }

  void updateDataSelecionadaAtIndex(
    int index,
    DateTime Function(DateTime) updateFn,
  ) {
    DataSelecionada[index] = updateFn(_DataSelecionada[index]);
  }

  void insertAtIndexInDataSelecionada(int index, DateTime value) {
    DataSelecionada.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
