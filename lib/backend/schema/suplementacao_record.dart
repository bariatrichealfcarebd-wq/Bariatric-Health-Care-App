import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SuplementacaoRecord extends FirestoreRecord {
  SuplementacaoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "doserecomendada" field.
  String? _doserecomendada;
  String get doserecomendada => _doserecomendada ?? '';
  bool hasDoserecomendada() => _doserecomendada != null;

  // "id_User" field.
  String? _idUser;
  String get idUser => _idUser ?? '';
  bool hasIdUser() => _idUser != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  void _initializeFields() {
    _doserecomendada = snapshotData['doserecomendada'] as String?;
    _idUser = snapshotData['id_User'] as String?;
    _data = snapshotData['data'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('suplementacao');

  static Stream<SuplementacaoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SuplementacaoRecord.fromSnapshot(s));

  static Future<SuplementacaoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SuplementacaoRecord.fromSnapshot(s));

  static SuplementacaoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SuplementacaoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SuplementacaoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SuplementacaoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SuplementacaoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SuplementacaoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSuplementacaoRecordData({
  String? doserecomendada,
  String? idUser,
  DateTime? data,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'doserecomendada': doserecomendada,
      'id_User': idUser,
      'data': data,
    }.withoutNulls,
  );

  return firestoreData;
}

class SuplementacaoRecordDocumentEquality
    implements Equality<SuplementacaoRecord> {
  const SuplementacaoRecordDocumentEquality();

  @override
  bool equals(SuplementacaoRecord? e1, SuplementacaoRecord? e2) {
    return e1?.doserecomendada == e2?.doserecomendada &&
        e1?.idUser == e2?.idUser &&
        e1?.data == e2?.data;
  }

  @override
  int hash(SuplementacaoRecord? e) =>
      const ListEquality().hash([e?.doserecomendada, e?.idUser, e?.data]);

  @override
  bool isValidKey(Object? o) => o is SuplementacaoRecord;
}
