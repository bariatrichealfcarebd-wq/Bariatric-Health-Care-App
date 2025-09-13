import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RelatoriosPdfRecord extends FirestoreRecord {
  RelatoriosPdfRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "pdf_url" field.
  String? _pdfUrl;
  String get pdfUrl => _pdfUrl ?? '';
  bool hasPdfUrl() => _pdfUrl != null;

  // "user_cpf" field.
  String? _userCpf;
  String get userCpf => _userCpf ?? '';
  bool hasUserCpf() => _userCpf != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _pdfUrl = snapshotData['pdf_url'] as String?;
    _userCpf = snapshotData['user_cpf'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('relatorios_pdf');

  static Stream<RelatoriosPdfRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RelatoriosPdfRecord.fromSnapshot(s));

  static Future<RelatoriosPdfRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RelatoriosPdfRecord.fromSnapshot(s));

  static RelatoriosPdfRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RelatoriosPdfRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RelatoriosPdfRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RelatoriosPdfRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RelatoriosPdfRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RelatoriosPdfRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRelatoriosPdfRecordData({
  String? pdfUrl,
  String? userCpf,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'pdf_url': pdfUrl,
      'user_cpf': userCpf,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class RelatoriosPdfRecordDocumentEquality
    implements Equality<RelatoriosPdfRecord> {
  const RelatoriosPdfRecordDocumentEquality();

  @override
  bool equals(RelatoriosPdfRecord? e1, RelatoriosPdfRecord? e2) {
    return e1?.pdfUrl == e2?.pdfUrl &&
        e1?.userCpf == e2?.userCpf &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(RelatoriosPdfRecord? e) =>
      const ListEquality().hash([e?.pdfUrl, e?.userCpf, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is RelatoriosPdfRecord;
}
