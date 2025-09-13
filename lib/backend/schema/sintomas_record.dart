import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SintomasRecord extends FirestoreRecord {
  SintomasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "nutrientes_associados" field.
  List<DocumentReference>? _nutrientesAssociados;
  List<DocumentReference> get nutrientesAssociados =>
      _nutrientesAssociados ?? const [];
  bool hasNutrientesAssociados() => _nutrientesAssociados != null;

  // "categoria" field.
  List<String>? _categoria;
  List<String> get categoria => _categoria ?? const [];
  bool hasCategoria() => _categoria != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _nutrientesAssociados = getDataList(snapshotData['nutrientes_associados']);
    _categoria = getDataList(snapshotData['categoria']);
    _uid = snapshotData['uid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sintomas');

  static Stream<SintomasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SintomasRecord.fromSnapshot(s));

  static Future<SintomasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SintomasRecord.fromSnapshot(s));

  static SintomasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SintomasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SintomasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SintomasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SintomasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SintomasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSintomasRecordData({
  String? nome,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class SintomasRecordDocumentEquality implements Equality<SintomasRecord> {
  const SintomasRecordDocumentEquality();

  @override
  bool equals(SintomasRecord? e1, SintomasRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nome == e2?.nome &&
        listEquality.equals(
            e1?.nutrientesAssociados, e2?.nutrientesAssociados) &&
        listEquality.equals(e1?.categoria, e2?.categoria) &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(SintomasRecord? e) => const ListEquality()
      .hash([e?.nome, e?.nutrientesAssociados, e?.categoria, e?.uid]);

  @override
  bool isValidKey(Object? o) => o is SintomasRecord;
}
