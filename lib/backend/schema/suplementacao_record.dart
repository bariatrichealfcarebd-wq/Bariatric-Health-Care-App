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

  // "id_User" field.
  String? _idUser;
  String get idUser => _idUser ?? '';
  bool hasIdUser() => _idUser != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "Anexo" field.
  String? _anexo;
  String get anexo => _anexo ?? '';
  bool hasAnexo() => _anexo != null;

  // "create_day" field.
  DateTime? _createDay;
  DateTime? get createDay => _createDay;
  bool hasCreateDay() => _createDay != null;

  void _initializeFields() {
    _idUser = snapshotData['id_User'] as String?;
    _data = snapshotData['data'] as DateTime?;
    _anexo = snapshotData['Anexo'] as String?;
    _createDay = snapshotData['create_day'] as DateTime?;
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
  String? idUser,
  DateTime? data,
  String? anexo,
  DateTime? createDay,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id_User': idUser,
      'data': data,
      'Anexo': anexo,
      'create_day': createDay,
    }.withoutNulls,
  );

  return firestoreData;
}

class SuplementacaoRecordDocumentEquality
    implements Equality<SuplementacaoRecord> {
  const SuplementacaoRecordDocumentEquality();

  @override
  bool equals(SuplementacaoRecord? e1, SuplementacaoRecord? e2) {
    return e1?.idUser == e2?.idUser &&
        e1?.data == e2?.data &&
        e1?.anexo == e2?.anexo &&
        e1?.createDay == e2?.createDay;
  }

  @override
  int hash(SuplementacaoRecord? e) =>
      const ListEquality().hash([e?.idUser, e?.data, e?.anexo, e?.createDay]);

  @override
  bool isValidKey(Object? o) => o is SuplementacaoRecord;
}
