import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DisponibilidadeRecord extends FirestoreRecord {
  DisponibilidadeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _data = snapshotData['data'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Disponibilidade');

  static Stream<DisponibilidadeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DisponibilidadeRecord.fromSnapshot(s));

  static Future<DisponibilidadeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DisponibilidadeRecord.fromSnapshot(s));

  static DisponibilidadeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DisponibilidadeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DisponibilidadeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DisponibilidadeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DisponibilidadeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DisponibilidadeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDisponibilidadeRecordData({
  String? id,
  DateTime? data,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'data': data,
    }.withoutNulls,
  );

  return firestoreData;
}

class DisponibilidadeRecordDocumentEquality
    implements Equality<DisponibilidadeRecord> {
  const DisponibilidadeRecordDocumentEquality();

  @override
  bool equals(DisponibilidadeRecord? e1, DisponibilidadeRecord? e2) {
    return e1?.id == e2?.id && e1?.data == e2?.data;
  }

  @override
  int hash(DisponibilidadeRecord? e) =>
      const ListEquality().hash([e?.id, e?.data]);

  @override
  bool isValidKey(Object? o) => o is DisponibilidadeRecord;
}
