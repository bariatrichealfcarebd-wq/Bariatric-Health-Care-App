import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Nutricionista vai criar os eventos na agenda para o usuario ver
class EventosRecord extends FirestoreRecord {
  EventosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nomeEvento" field.
  String? _nomeEvento;
  String get nomeEvento => _nomeEvento ?? '';
  bool hasNomeEvento() => _nomeEvento != null;

  // "dataEvento" field.
  DateTime? _dataEvento;
  DateTime? get dataEvento => _dataEvento;
  bool hasDataEvento() => _dataEvento != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nomeEvento = snapshotData['nomeEvento'] as String?;
    _dataEvento = snapshotData['dataEvento'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Eventos')
          : FirebaseFirestore.instance.collectionGroup('Eventos');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Eventos').doc(id);

  static Stream<EventosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventosRecord.fromSnapshot(s));

  static Future<EventosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventosRecord.fromSnapshot(s));

  static EventosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EventosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventosRecordData({
  String? nomeEvento,
  DateTime? dataEvento,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nomeEvento': nomeEvento,
      'dataEvento': dataEvento,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventosRecordDocumentEquality implements Equality<EventosRecord> {
  const EventosRecordDocumentEquality();

  @override
  bool equals(EventosRecord? e1, EventosRecord? e2) {
    return e1?.nomeEvento == e2?.nomeEvento && e1?.dataEvento == e2?.dataEvento;
  }

  @override
  int hash(EventosRecord? e) =>
      const ListEquality().hash([e?.nomeEvento, e?.dataEvento]);

  @override
  bool isValidKey(Object? o) => o is EventosRecord;
}
