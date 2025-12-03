import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

// codigo gerado automaticamente pelo flutterflow: esquema de dados firestore

class LigacaoSintomaRecord extends FirestoreRecord {
  LigacaoSintomaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  List<String>? _idNutriente;
  List<String> get idNutriente => _idNutriente ?? const [];
  bool hasIdNutriente() => _idNutriente != null;

  String? _idSintoma;
  String get idSintoma => _idSintoma ?? '';
  bool hasIdSintoma() => _idSintoma != null;

  String? _cpfUsuario;
  String get cpfUsuario => _cpfUsuario ?? '';
  bool hasCpfUsuario() => _cpfUsuario != null;

  String? _nomeSintoma;
  String get nomeSintoma => _nomeSintoma ?? '';
  bool hasNomeSintoma() => _nomeSintoma != null;

  String? _nomeUser;
  String get nomeUser => _nomeUser ?? '';
  bool hasNomeUser() => _nomeUser != null;

  void _initializeFields() {
    _idNutriente = getDataList(snapshotData['id_nutriente']);
    _idSintoma = snapshotData['id_sintoma'] as String?;
    _cpfUsuario = snapshotData['cpf_usuario'] as String?;
    _nomeSintoma = snapshotData['nomeSintoma'] as String?;
    _nomeUser = snapshotData['nome_User'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ligacao_sintoma');

  static Stream<LigacaoSintomaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LigacaoSintomaRecord.fromSnapshot(s));

  static Future<LigacaoSintomaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LigacaoSintomaRecord.fromSnapshot(s));

  static LigacaoSintomaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LigacaoSintomaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LigacaoSintomaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LigacaoSintomaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LigacaoSintomaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LigacaoSintomaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLigacaoSintomaRecordData({
  String? idSintoma,
  String? cpfUsuario,
  String? nomeSintoma,
  String? nomeUser,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_sintoma': idSintoma,
      'cpf_usuario': cpfUsuario,
      'nomeSintoma': nomeSintoma,
      'nome_User': nomeUser,
    }.withoutNulls,
  );

  return firestoreData;
}

class LigacaoSintomaRecordDocumentEquality
    implements Equality<LigacaoSintomaRecord> {
  const LigacaoSintomaRecordDocumentEquality();

  @override
  bool equals(LigacaoSintomaRecord? e1, LigacaoSintomaRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.idNutriente, e2?.idNutriente) &&
        e1?.idSintoma == e2?.idSintoma &&
        e1?.cpfUsuario == e2?.cpfUsuario &&
        e1?.nomeSintoma == e2?.nomeSintoma &&
        e1?.nomeUser == e2?.nomeUser;
  }

  @override
  int hash(LigacaoSintomaRecord? e) => const ListEquality().hash([
        e?.idNutriente,
        e?.idSintoma,
        e?.cpfUsuario,
        e?.nomeSintoma,
        e?.nomeUser
      ]);

  @override
  bool isValidKey(Object? o) => o is LigacaoSintomaRecord;
}
