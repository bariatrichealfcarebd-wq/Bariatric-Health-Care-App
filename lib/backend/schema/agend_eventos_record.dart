import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AgendEventosRecord extends FirestoreRecord {
  AgendEventosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "Hora" field.
  DateTime? _hora;
  DateTime? get hora => _hora;
  bool hasHora() => _hora != null;

  // "uid_Paaciente" field.
  String? _uidPaaciente;
  String get uidPaaciente => _uidPaaciente ?? '';
  bool hasUidPaaciente() => _uidPaaciente != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  void _initializeFields() {
    _data = snapshotData['Data'] as DateTime?;
    _hora = snapshotData['Hora'] as DateTime?;
    _uidPaaciente = snapshotData['uid_Paaciente'] as String?;
    _descricao = snapshotData['descricao'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('AgendEventos');

  static Stream<AgendEventosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AgendEventosRecord.fromSnapshot(s));

  static Future<AgendEventosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AgendEventosRecord.fromSnapshot(s));

  static AgendEventosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AgendEventosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AgendEventosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AgendEventosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AgendEventosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AgendEventosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAgendEventosRecordData({
  DateTime? data,
  DateTime? hora,
  String? uidPaaciente,
  String? descricao,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Data': data,
      'Hora': hora,
      'uid_Paaciente': uidPaaciente,
      'descricao': descricao,
    }.withoutNulls,
  );

  return firestoreData;
}

class AgendEventosRecordDocumentEquality
    implements Equality<AgendEventosRecord> {
  const AgendEventosRecordDocumentEquality();

  @override
  bool equals(AgendEventosRecord? e1, AgendEventosRecord? e2) {
    return e1?.data == e2?.data &&
        e1?.hora == e2?.hora &&
        e1?.uidPaaciente == e2?.uidPaaciente &&
        e1?.descricao == e2?.descricao;
  }

  @override
  int hash(AgendEventosRecord? e) => const ListEquality()
      .hash([e?.data, e?.hora, e?.uidPaaciente, e?.descricao]);

  @override
  bool isValidKey(Object? o) => o is AgendEventosRecord;
}
