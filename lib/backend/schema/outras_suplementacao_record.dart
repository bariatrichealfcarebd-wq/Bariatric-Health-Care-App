import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OutrasSuplementacaoRecord extends FirestoreRecord {
  OutrasSuplementacaoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "id_User" field.
  String? _idUser;
  String get idUser => _idUser ?? '';
  bool hasIdUser() => _idUser != null;

  // "dataMedic" field.
  DateTime? _dataMedic;
  DateTime? get dataMedic => _dataMedic;
  bool hasDataMedic() => _dataMedic != null;

  // "anexo" field.
  String? _anexo;
  String get anexo => _anexo ?? '';
  bool hasAnexo() => _anexo != null;

  // "create_day" field.
  DateTime? _createDay;
  DateTime? get createDay => _createDay;
  bool hasCreateDay() => _createDay != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _idUser = snapshotData['id_User'] as String?;
    _dataMedic = snapshotData['dataMedic'] as DateTime?;
    _anexo = snapshotData['anexo'] as String?;
    _createDay = snapshotData['create_day'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('outrasSuplementacao');

  static Stream<OutrasSuplementacaoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OutrasSuplementacaoRecord.fromSnapshot(s));

  static Future<OutrasSuplementacaoRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => OutrasSuplementacaoRecord.fromSnapshot(s));

  static OutrasSuplementacaoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OutrasSuplementacaoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OutrasSuplementacaoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OutrasSuplementacaoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OutrasSuplementacaoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OutrasSuplementacaoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOutrasSuplementacaoRecordData({
  String? nome,
  String? idUser,
  DateTime? dataMedic,
  String? anexo,
  DateTime? createDay,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'id_User': idUser,
      'dataMedic': dataMedic,
      'anexo': anexo,
      'create_day': createDay,
    }.withoutNulls,
  );

  return firestoreData;
}

class OutrasSuplementacaoRecordDocumentEquality
    implements Equality<OutrasSuplementacaoRecord> {
  const OutrasSuplementacaoRecordDocumentEquality();

  @override
  bool equals(OutrasSuplementacaoRecord? e1, OutrasSuplementacaoRecord? e2) {
    return e1?.nome == e2?.nome &&
        e1?.idUser == e2?.idUser &&
        e1?.dataMedic == e2?.dataMedic &&
        e1?.anexo == e2?.anexo &&
        e1?.createDay == e2?.createDay;
  }

  @override
  int hash(OutrasSuplementacaoRecord? e) => const ListEquality()
      .hash([e?.nome, e?.idUser, e?.dataMedic, e?.anexo, e?.createDay]);

  @override
  bool isValidKey(Object? o) => o is OutrasSuplementacaoRecord;
}
