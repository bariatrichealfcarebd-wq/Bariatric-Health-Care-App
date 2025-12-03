import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificacoesRecord extends FirestoreRecord {
  NotificacoesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "destinatarioUid" field.
  String? _destinatarioUid;
  String get destinatarioUid => _destinatarioUid ?? '';
  bool hasDestinatarioUid() => _destinatarioUid != null;

  // "remetenteUid" field.
  String? _remetenteUid;
  String get remetenteUid => _remetenteUid ?? '';
  bool hasRemetenteUid() => _remetenteUid != null;

  // "mensagem" field.
  String? _mensagem;
  String get mensagem => _mensagem ?? '';
  bool hasMensagem() => _mensagem != null;

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "lida" field.
  bool? _lida;
  bool get lida => _lida ?? false;
  bool hasLida() => _lida != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  void _initializeFields() {
    _destinatarioUid = snapshotData['destinatarioUid'] as String?;
    _remetenteUid = snapshotData['remetenteUid'] as String?;
    _mensagem = snapshotData['mensagem'] as String?;
    _tipo = snapshotData['tipo'] as String?;
    _lida = snapshotData['lida'] as bool?;
    _data = snapshotData['data'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notificacoes');

  static Stream<NotificacoesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificacoesRecord.fromSnapshot(s));

  static Future<NotificacoesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificacoesRecord.fromSnapshot(s));

  static NotificacoesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificacoesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificacoesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificacoesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificacoesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificacoesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificacoesRecordData({
  String? destinatarioUid,
  String? remetenteUid,
  String? mensagem,
  String? tipo,
  bool? lida,
  DateTime? data,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'destinatarioUid': destinatarioUid,
      'remetenteUid': remetenteUid,
      'mensagem': mensagem,
      'tipo': tipo,
      'lida': lida,
      'data': data,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificacoesRecordDocumentEquality
    implements Equality<NotificacoesRecord> {
  const NotificacoesRecordDocumentEquality();

  @override
  bool equals(NotificacoesRecord? e1, NotificacoesRecord? e2) {
    return e1?.destinatarioUid == e2?.destinatarioUid &&
        e1?.remetenteUid == e2?.remetenteUid &&
        e1?.mensagem == e2?.mensagem &&
        e1?.tipo == e2?.tipo &&
        e1?.lida == e2?.lida &&
        e1?.data == e2?.data;
  }

  @override
  int hash(NotificacoesRecord? e) => const ListEquality().hash([
        e?.destinatarioUid,
        e?.remetenteUid,
        e?.mensagem,
        e?.tipo,
        e?.lida,
        e?.data
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificacoesRecord;
}
