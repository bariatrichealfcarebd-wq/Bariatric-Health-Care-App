import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

// codigo gerado automaticamente pelo flutterflow: esquema da coleção Nutri_Paciente no Firestore

class NutriPacienteRecord extends FirestoreRecord {
  NutriPacienteRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  String? _uidPaciente;
  String get uidPaciente => _uidPaciente ?? '';
  bool hasUidPaciente() => _uidPaciente != null;

  String? _uidNutri;
  String get uidNutri => _uidNutri ?? '';
  bool hasUidNutri() => _uidNutri != null;

  void _initializeFields() {
    _uidPaciente = snapshotData['uid_Paciente'] as String?;
    _uidNutri = snapshotData['uid_Nutri'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Nutri_Paciente');

  static Stream<NutriPacienteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NutriPacienteRecord.fromSnapshot(s));

  static Future<NutriPacienteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NutriPacienteRecord.fromSnapshot(s));

  static NutriPacienteRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NutriPacienteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NutriPacienteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NutriPacienteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NutriPacienteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NutriPacienteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNutriPacienteRecordData({
  String? uidPaciente,
  String? uidNutri,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid_Paciente': uidPaciente,
      'uid_Nutri': uidNutri,
    }.withoutNulls,
  );

  return firestoreData;
}

class NutriPacienteRecordDocumentEquality
    implements Equality<NutriPacienteRecord> {
  const NutriPacienteRecordDocumentEquality();

  @override
  bool equals(NutriPacienteRecord? e1, NutriPacienteRecord? e2) {
    return e1?.uidPaciente == e2?.uidPaciente && e1?.uidNutri == e2?.uidNutri;
  }

  @override
  int hash(NutriPacienteRecord? e) =>
      const ListEquality().hash([e?.uidPaciente, e?.uidNutri]);

  @override
  bool isValidKey(Object? o) => o is NutriPacienteRecord;
}
