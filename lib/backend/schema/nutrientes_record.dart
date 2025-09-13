import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NutrientesRecord extends FirestoreRecord {
  NutrientesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "sigla" field.
  String? _sigla;
  String get sigla => _sigla ?? '';
  bool hasSigla() => _sigla != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _sigla = snapshotData['sigla'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Nutrientes');

  static Stream<NutrientesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NutrientesRecord.fromSnapshot(s));

  static Future<NutrientesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NutrientesRecord.fromSnapshot(s));

  static NutrientesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NutrientesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NutrientesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NutrientesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NutrientesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NutrientesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNutrientesRecordData({
  String? nome,
  String? sigla,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'sigla': sigla,
    }.withoutNulls,
  );

  return firestoreData;
}

class NutrientesRecordDocumentEquality implements Equality<NutrientesRecord> {
  const NutrientesRecordDocumentEquality();

  @override
  bool equals(NutrientesRecord? e1, NutrientesRecord? e2) {
    return e1?.nome == e2?.nome && e1?.sigla == e2?.sigla;
  }

  @override
  int hash(NutrientesRecord? e) =>
      const ListEquality().hash([e?.nome, e?.sigla]);

  @override
  bool isValidKey(Object? o) => o is NutrientesRecord;
}
