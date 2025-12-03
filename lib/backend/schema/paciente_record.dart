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

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "searchKeywords" field.
  List<String>? _searchKeywords;
  List<String> get searchKeywords => _searchKeywords ?? const [];
  bool hasSearchKeywords() => _searchKeywords != null;

  // "admLess" field.
  bool? _admLess;
  bool get admLess => _admLess ?? false;
  bool hasAdmLess() => _admLess != null;

  // "isADM" field.
  bool? _isADM;
  bool get isADM => _isADM ?? false;
  bool hasIsADM() => _isADM != null;

  // "primeiroLoginRealizado" field.
  bool? _primeiroLoginRealizado;
  bool get primeiroLoginRealizado => _primeiroLoginRealizado ?? false;
  bool hasPrimeiroLoginRealizado() => _primeiroLoginRealizado != null;

  // "crn" field.
  String? _crn;
  String get crn => _crn ?? '';
  bool hasCrn() => _crn != null;

  // "especializacao" field.
  String? _especializacao;
  String get especializacao => _especializacao ?? '';
  bool hasEspecializacao() => _especializacao != null;

  // "telefone" field.
  String? _telefone;
  String get telefone => _telefone ?? '';
  bool hasTelefone() => _telefone != null;

  // "tipoOperacao" field.
  String? _tipoOperacao;
  String get tipoOperacao => _tipoOperacao ?? '';
  bool hasTipoOperacao() => _tipoOperacao != null;

  // "dataOperacao" field.
  String? _dataOperacao;
  String get dataOperacao => _dataOperacao ?? '';
  bool hasDataOperacao() => _dataOperacao != null;

  // "codigoPaciente" field.
  String? _codigoPaciente;
  String get codigoPaciente => _codigoPaciente ?? '';
  bool hasCodigoPaciente() => _codigoPaciente != null;

  // "termo" field.
  bool? _termo;
  bool get termo => _termo ?? false;
  bool hasTermo() => _termo != null;

  // "uid_Nutri" field.
  String? _uidNutri;
  String get uidNutri => _uidNutri ?? '';
  bool hasUidNutri() => _uidNutri != null;

  void _initializeFields() {
    _nome = snapshotData['Nome'] as String?;
    _senha = snapshotData['Senha'] as String?;
    _cpf = snapshotData['CPF'] as String?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _searchKeywords = getDataList(snapshotData['searchKeywords']);
    _admLess = snapshotData['admLess'] as bool?;
    _isADM = snapshotData['isADM'] as bool?;
    _primeiroLoginRealizado = snapshotData['primeiroLoginRealizado'] as bool?;
    _crn = snapshotData['crn'] as String?;
    _especializacao = snapshotData['especializacao'] as String?;
    _telefone = snapshotData['telefone'] as String?;
    _tipoOperacao = snapshotData['tipoOperacao'] as String?;
    _dataOperacao = snapshotData['dataOperacao'] as String?;
    _codigoPaciente = snapshotData['codigoPaciente'] as String?;
    _termo = snapshotData['termo'] as bool?;
    _uidNutri = snapshotData['uid_Nutri'] as String?;
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
  String? photoUrl,
  bool? admLess,
  bool? isADM,
  bool? primeiroLoginRealizado,
  String? crn,
  String? especializacao,
  String? telefone,
  String? tipoOperacao,
  String? dataOperacao,
  String? codigoPaciente,
  bool? termo,
  String? uidNutri,
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
      'photo_url': photoUrl,
      'admLess': admLess,
      'isADM': isADM,
      'primeiroLoginRealizado': primeiroLoginRealizado,
      'crn': crn,
      'especializacao': especializacao,
      'telefone': telefone,
      'tipoOperacao': tipoOperacao,
      'dataOperacao': dataOperacao,
      'codigoPaciente': codigoPaciente,
      'termo': termo,
      'uid_Nutri': uidNutri,
    }.withoutNulls,
  );

  return firestoreData;
}

class PacienteRecordDocumentEquality implements Equality<PacienteRecord> {
  const PacienteRecordDocumentEquality();

  @override
  bool equals(PacienteRecord? e1, PacienteRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nome == e2?.nome &&
        e1?.senha == e2?.senha &&
        e1?.cpf == e2?.cpf &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.uid == e2?.uid &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.createdTime == e2?.createdTime &&
        e1?.photoUrl == e2?.photoUrl &&
        listEquality.equals(e1?.searchKeywords, e2?.searchKeywords) &&
        e1?.admLess == e2?.admLess &&
        e1?.isADM == e2?.isADM &&
        e1?.primeiroLoginRealizado == e2?.primeiroLoginRealizado &&
        e1?.crn == e2?.crn &&
        e1?.especializacao == e2?.especializacao &&
        e1?.telefone == e2?.telefone &&
        e1?.tipoOperacao == e2?.tipoOperacao &&
        e1?.dataOperacao == e2?.dataOperacao &&
        e1?.codigoPaciente == e2?.codigoPaciente &&
        e1?.termo == e2?.termo &&
        e1?.uidNutri == e2?.uidNutri;
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
        e?.photoUrl,
        e?.searchKeywords,
        e?.admLess,
        e?.isADM,
        e?.primeiroLoginRealizado,
        e?.crn,
        e?.especializacao,
        e?.telefone,
        e?.tipoOperacao,
        e?.dataOperacao,
        e?.codigoPaciente,
        e?.termo,
        e?.uidNutri
      ]);

  @override
  bool isValidKey(Object? o) => o is PacienteRecord;
}
