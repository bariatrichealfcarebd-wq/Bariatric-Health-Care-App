import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RelatoriosQuestionarioRecord extends FirestoreRecord {
  RelatoriosQuestionarioRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome_paciente" field.
  String? _nomePaciente;
  String get nomePaciente => _nomePaciente ?? '';
  bool hasNomePaciente() => _nomePaciente != null;

  // "url_pdf" field.
  String? _urlPdf;
  String get urlPdf => _urlPdf ?? '';
  bool hasUrlPdf() => _urlPdf != null;

  // "data_criacao" field.
  DateTime? _dataCriacao;
  DateTime? get dataCriacao => _dataCriacao;
  bool hasDataCriacao() => _dataCriacao != null;

  // "nome_do_arquivo" field.
  String? _nomeDoArquivo;
  String get nomeDoArquivo => _nomeDoArquivo ?? '';
  bool hasNomeDoArquivo() => _nomeDoArquivo != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _nomePaciente = snapshotData['nome_paciente'] as String?;
    _urlPdf = snapshotData['url_pdf'] as String?;
    _dataCriacao = snapshotData['data_criacao'] as DateTime?;
    _nomeDoArquivo = snapshotData['nome_do_arquivo'] as String?;
    _uid = snapshotData['uid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('relatorios_Questionario');

  static Stream<RelatoriosQuestionarioRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => RelatoriosQuestionarioRecord.fromSnapshot(s));

  static Future<RelatoriosQuestionarioRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => RelatoriosQuestionarioRecord.fromSnapshot(s));

  static RelatoriosQuestionarioRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RelatoriosQuestionarioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RelatoriosQuestionarioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RelatoriosQuestionarioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RelatoriosQuestionarioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RelatoriosQuestionarioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRelatoriosQuestionarioRecordData({
  String? nomePaciente,
  String? urlPdf,
  DateTime? dataCriacao,
  String? nomeDoArquivo,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome_paciente': nomePaciente,
      'url_pdf': urlPdf,
      'data_criacao': dataCriacao,
      'nome_do_arquivo': nomeDoArquivo,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class RelatoriosQuestionarioRecordDocumentEquality
    implements Equality<RelatoriosQuestionarioRecord> {
  const RelatoriosQuestionarioRecordDocumentEquality();

  @override
  bool equals(
      RelatoriosQuestionarioRecord? e1, RelatoriosQuestionarioRecord? e2) {
    return e1?.nomePaciente == e2?.nomePaciente &&
        e1?.urlPdf == e2?.urlPdf &&
        e1?.dataCriacao == e2?.dataCriacao &&
        e1?.nomeDoArquivo == e2?.nomeDoArquivo &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(RelatoriosQuestionarioRecord? e) => const ListEquality().hash(
      [e?.nomePaciente, e?.urlPdf, e?.dataCriacao, e?.nomeDoArquivo, e?.uid]);

  @override
  bool isValidKey(Object? o) => o is RelatoriosQuestionarioRecord;
}
