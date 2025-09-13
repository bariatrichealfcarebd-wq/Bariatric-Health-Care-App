import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlanoAlimentacaoRecord extends FirestoreRecord {
  PlanoAlimentacaoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "pdf_alimentacao" field.
  String? _pdfAlimentacao;
  String get pdfAlimentacao => _pdfAlimentacao ?? '';
  bool hasPdfAlimentacao() => _pdfAlimentacao != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as String?;
    _pdfAlimentacao = snapshotData['pdf_alimentacao'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Plano_Alimentacao');

  static Stream<PlanoAlimentacaoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlanoAlimentacaoRecord.fromSnapshot(s));

  static Future<PlanoAlimentacaoRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PlanoAlimentacaoRecord.fromSnapshot(s));

  static PlanoAlimentacaoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PlanoAlimentacaoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlanoAlimentacaoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlanoAlimentacaoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlanoAlimentacaoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlanoAlimentacaoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlanoAlimentacaoRecordData({
  String? userId,
  String? pdfAlimentacao,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'pdf_alimentacao': pdfAlimentacao,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlanoAlimentacaoRecordDocumentEquality
    implements Equality<PlanoAlimentacaoRecord> {
  const PlanoAlimentacaoRecordDocumentEquality();

  @override
  bool equals(PlanoAlimentacaoRecord? e1, PlanoAlimentacaoRecord? e2) {
    return e1?.userId == e2?.userId && e1?.pdfAlimentacao == e2?.pdfAlimentacao;
  }

  @override
  int hash(PlanoAlimentacaoRecord? e) =>
      const ListEquality().hash([e?.userId, e?.pdfAlimentacao]);

  @override
  bool isValidKey(Object? o) => o is PlanoAlimentacaoRecord;
}
