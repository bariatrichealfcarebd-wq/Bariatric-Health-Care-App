import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PacienteRecord extends FirestoreRecord {
  PacienteRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "Senha" field.
  String? _senha;
  String get senha => _senha ?? '';
  bool hasSenha() => _senha != null;

  // "CPF" field.
  String? _cpf;
  String get cpf => _cpf ?? '';
  bool hasCpf() => _cpf != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "Data_operacao" field.
  String? _dataOperacao;
  String get dataOperacao => _dataOperacao ?? '';
  bool hasDataOperacao() => _dataOperacao != null;

  // "IsADM" field.
  bool? _isADM;
  bool get isADM => _isADM ?? false;
  bool hasIsADM() => _isADM != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  void _initializeFields() {
    _nome = snapshotData['Nome'] as String?;
    _senha = snapshotData['Senha'] as String?;
    _cpf = snapshotData['CPF'] as String?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _dataOperacao = snapshotData['Data_operacao'] as String?;
    _isADM = snapshotData['IsADM'] as bool?;
    _photoUrl = snapshotData['photo_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Paciente');

  static Stream<PacienteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PacienteRecord.fromSnapshot(s));

  static Future<PacienteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PacienteRecord.fromSnapshot(s));

  static PacienteRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PacienteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PacienteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PacienteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PacienteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PacienteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPacienteRecordData({
  String? nome,
  String? senha,
  String? cpf,
  String? email,
  String? displayName,
  String? uid,
  String? phoneNumber,
  DateTime? createdTime,
  String? dataOperacao,
  bool? isADM,
  String? photoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Nome': nome,
      'Senha': senha,
      'CPF': cpf,
      'email': email,
      'display_name': displayName,
      'uid': uid,
      'phone_number': phoneNumber,
      'created_time': createdTime,
      'Data_operacao': dataOperacao,
      'IsADM': isADM,
      'photo_url': photoUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class PacienteRecordDocumentEquality implements Equality<PacienteRecord> {
  const PacienteRecordDocumentEquality();

  @override
  bool equals(PacienteRecord? e1, PacienteRecord? e2) {
    return e1?.nome == e2?.nome &&
        e1?.senha == e2?.senha &&
        e1?.cpf == e2?.cpf &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.uid == e2?.uid &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.createdTime == e2?.createdTime &&
        e1?.dataOperacao == e2?.dataOperacao &&
        e1?.isADM == e2?.isADM &&
        e1?.photoUrl == e2?.photoUrl;
  }

  @override
  int hash(PacienteRecord? e) => const ListEquality().hash([
        e?.nome,
        e?.senha,
        e?.cpf,
        e?.email,
        e?.displayName,
        e?.uid,
        e?.phoneNumber,
        e?.createdTime,
        e?.dataOperacao,
        e?.isADM,
        e?.photoUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is PacienteRecord;
}
