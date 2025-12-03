import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

// codigo gerado automaticamente pelo flutterflow: esquema de dados firestore

class NutrientesRecord extends FirestoreRecord {
  NutrientesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  String? _sigla;
  String get sigla => _sigla ?? '';
  bool hasSigla() => _sigla != null;

  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  String? _tipousuario;
  String get tipousuario => _tipousuario ?? '';
  bool hasTipousuario() => _tipousuario != null;

  String? _telefone;
  String get telefone => _telefone ?? '';
  bool hasTelefone() => _telefone != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _sigla = snapshotData['sigla'] as String?;
    _email = snapshotData['email'] as String?;
    _uid = snapshotData['uid'] as String?;
    _tipousuario = snapshotData['tipousuario'] as String?;
    _telefone = snapshotData['telefone'] as String?;
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
  String? email,
  String? uid,
  String? tipousuario,
  String? telefone,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'sigla': sigla,
      'email': email,
      'uid': uid,
      'tipousuario': tipousuario,
      'telefone': telefone,
    }.withoutNulls,
  );

  return firestoreData;
}

class NutrientesRecordDocumentEquality implements Equality<NutrientesRecord> {
  const NutrientesRecordDocumentEquality();

  @override
  bool equals(NutrientesRecord? e1, NutrientesRecord? e2) {
    return e1?.nome == e2?.nome &&
        e1?.sigla == e2?.sigla &&
        e1?.email == e2?.email &&
        e1?.uid == e2?.uid &&
        e1?.tipousuario == e2?.tipousuario &&
        e1?.telefone == e2?.telefone;
  }

  @override
  int hash(NutrientesRecord? e) => const ListEquality()
      .hash([e?.nome, e?.sigla, e?.email, e?.uid, e?.tipousuario, e?.telefone]);

  @override
  bool isValidKey(Object? o) => o is NutrientesRecord;
}
