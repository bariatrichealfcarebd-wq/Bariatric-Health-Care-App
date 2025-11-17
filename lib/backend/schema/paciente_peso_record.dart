import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Nutri vai registrar o peso do paciente
class PacientePesoRecord extends FirestoreRecord {
  PacientePesoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "peso" field.
  double? _peso;
  double get peso => _peso ?? 0.0;
  bool hasPeso() => _peso != null;

  // "data_registro" field.
  DateTime? _dataRegistro;
  DateTime? get dataRegistro => _dataRegistro;
  bool hasDataRegistro() => _dataRegistro != null;

  // "uid_Paciente" field.
  String? _uidPaciente;
  String get uidPaciente => _uidPaciente ?? '';
  bool hasUidPaciente() => _uidPaciente != null;

  void _initializeFields() {
    _peso = castToType<double>(snapshotData['peso']);
    _dataRegistro = snapshotData['data_registro'] as DateTime?;
    _uidPaciente = snapshotData['uid_Paciente'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Paciente_Peso');

  static Stream<PacientePesoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PacientePesoRecord.fromSnapshot(s));

  static Future<PacientePesoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PacientePesoRecord.fromSnapshot(s));

  static PacientePesoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PacientePesoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PacientePesoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PacientePesoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PacientePesoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PacientePesoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPacientePesoRecordData({
  double? peso,
  DateTime? dataRegistro,
  String? uidPaciente,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'peso': peso,
      'data_registro': dataRegistro,
      'uid_Paciente': uidPaciente,
    }.withoutNulls,
  );

  return firestoreData;
}

class PacientePesoRecordDocumentEquality
    implements Equality<PacientePesoRecord> {
  const PacientePesoRecordDocumentEquality();

  @override
  bool equals(PacientePesoRecord? e1, PacientePesoRecord? e2) {
    return e1?.peso == e2?.peso &&
        e1?.dataRegistro == e2?.dataRegistro &&
        e1?.uidPaciente == e2?.uidPaciente;
  }

  @override
  int hash(PacientePesoRecord? e) =>
      const ListEquality().hash([e?.peso, e?.dataRegistro, e?.uidPaciente]);

  @override
  bool isValidKey(Object? o) => o is PacientePesoRecord;
}
