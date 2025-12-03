import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

// codigo gerado automaticamente pelo flutterflow: esquema de dados firestore

class SuplementacaodiariaRecord extends FirestoreRecord {
  SuplementacaodiariaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  String? _tipoSuplementacao;
  String get tipoSuplementacao => _tipoSuplementacao ?? '';
  bool hasTipoSuplementacao() => _tipoSuplementacao != null;

  String? _idUser;
  String get idUser => _idUser ?? '';
  bool hasIdUser() => _idUser != null;

  String? _anexo;
  String get anexo => _anexo ?? '';
  bool hasAnexo() => _anexo != null;

  DateTime? _creatDay;
  DateTime? get creatDay => _creatDay;
  bool hasCreatDay() => _creatDay != null;

  DateTime? _creatSuple;
  DateTime? get creatSuple => _creatSuple;
  bool hasCreatSuple() => _creatSuple != null;

  String? _nomeArquivo;
  String get nomeArquivo => _nomeArquivo ?? '';
  bool hasNomeArquivo() => _nomeArquivo != null;

  void _initializeFields() {
    _tipoSuplementacao = snapshotData['tipoSuplementacao'] as String?;
    _idUser = snapshotData['id_User'] as String?;
    _anexo = snapshotData['anexo'] as String?;
    _creatDay = snapshotData['creat_day'] as DateTime?;
    _creatSuple = snapshotData['creat_suple'] as DateTime?;
    _nomeArquivo = snapshotData['nomeArquivo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Suplementacaodiaria');

  static Stream<SuplementacaodiariaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SuplementacaodiariaRecord.fromSnapshot(s));

  static Future<SuplementacaodiariaRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SuplementacaodiariaRecord.fromSnapshot(s));

  static SuplementacaodiariaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SuplementacaodiariaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SuplementacaodiariaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SuplementacaodiariaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SuplementacaodiariaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SuplementacaodiariaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSuplementacaodiariaRecordData({
  String? tipoSuplementacao,
  String? idUser,
  String? anexo,
  DateTime? creatDay,
  DateTime? creatSuple,
  String? nomeArquivo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tipoSuplementacao': tipoSuplementacao,
      'id_User': idUser,
      'anexo': anexo,
      'creat_day': creatDay,
      'creat_suple': creatSuple,
      'nomeArquivo': nomeArquivo,
    }.withoutNulls,
  );

  return firestoreData;
}

class SuplementacaodiariaRecordDocumentEquality
    implements Equality<SuplementacaodiariaRecord> {
  const SuplementacaodiariaRecordDocumentEquality();

  @override
  bool equals(SuplementacaodiariaRecord? e1, SuplementacaodiariaRecord? e2) {
    return e1?.tipoSuplementacao == e2?.tipoSuplementacao &&
        e1?.idUser == e2?.idUser &&
        e1?.anexo == e2?.anexo &&
        e1?.creatDay == e2?.creatDay &&
        e1?.creatSuple == e2?.creatSuple &&
        e1?.nomeArquivo == e2?.nomeArquivo;
  }

  @override
  int hash(SuplementacaodiariaRecord? e) => const ListEquality().hash([
        e?.tipoSuplementacao,
        e?.idUser,
        e?.anexo,
        e?.creatDay,
        e?.creatSuple,
        e?.nomeArquivo
      ]);

  @override
  bool isValidKey(Object? o) => o is SuplementacaodiariaRecord;
}
