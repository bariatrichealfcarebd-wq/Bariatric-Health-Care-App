import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SuplementacaodiariaRecord extends FirestoreRecord {
  SuplementacaodiariaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "tipoSuplementacao" field.
  String? _tipoSuplementacao;
  String get tipoSuplementacao => _tipoSuplementacao ?? '';
  bool hasTipoSuplementacao() => _tipoSuplementacao != null;

  // "doseRecomendada" field.
  String? _doseRecomendada;
  String get doseRecomendada => _doseRecomendada ?? '';
  bool hasDoseRecomendada() => _doseRecomendada != null;

  // "id_User" field.
  String? _idUser;
  String get idUser => _idUser ?? '';
  bool hasIdUser() => _idUser != null;

  void _initializeFields() {
    _tipoSuplementacao = snapshotData['tipoSuplementacao'] as String?;
    _doseRecomendada = snapshotData['doseRecomendada'] as String?;
    _idUser = snapshotData['id_User'] as String?;
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
  String? doseRecomendada,
  String? idUser,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tipoSuplementacao': tipoSuplementacao,
      'doseRecomendada': doseRecomendada,
      'id_User': idUser,
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
        e1?.doseRecomendada == e2?.doseRecomendada &&
        e1?.idUser == e2?.idUser;
  }

  @override
  int hash(SuplementacaodiariaRecord? e) => const ListEquality()
      .hash([e?.tipoSuplementacao, e?.doseRecomendada, e?.idUser]);

  @override
  bool isValidKey(Object? o) => o is SuplementacaodiariaRecord;
}
