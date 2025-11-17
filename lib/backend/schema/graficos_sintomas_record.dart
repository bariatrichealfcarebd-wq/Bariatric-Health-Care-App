import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GraficosSintomasRecord extends FirestoreRecord {
  GraficosSintomasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nomeSintoma" field.
  String? _nomeSintoma;
  String get nomeSintoma => _nomeSintoma ?? '';
  bool hasNomeSintoma() => _nomeSintoma != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "mes_nome" field.
  String? _mesNome;
  String get mesNome => _mesNome ?? '';
  bool hasMesNome() => _mesNome != null;

  // "mes_numero" field.
  int? _mesNumero;
  int get mesNumero => _mesNumero ?? 0;
  bool hasMesNumero() => _mesNumero != null;

  // "ano" field.
  int? _ano;
  int get ano => _ano ?? 0;
  bool hasAno() => _ano != null;

  // "data_criacao" field.
  DateTime? _dataCriacao;
  DateTime? get dataCriacao => _dataCriacao;
  bool hasDataCriacao() => _dataCriacao != null;

  // "id_sintoma" field.
  String? _idSintoma;
  String get idSintoma => _idSintoma ?? '';
  bool hasIdSintoma() => _idSintoma != null;

  // "id_nutriente" field.
  List<String>? _idNutriente;
  List<String> get idNutriente => _idNutriente ?? const [];
  bool hasIdNutriente() => _idNutriente != null;

  void _initializeFields() {
    _nomeSintoma = snapshotData['nomeSintoma'] as String?;
    _userId = snapshotData['user_id'] as String?;
    _mesNome = snapshotData['mes_nome'] as String?;
    _mesNumero = castToType<int>(snapshotData['mes_numero']);
    _ano = castToType<int>(snapshotData['ano']);
    _dataCriacao = snapshotData['data_criacao'] as DateTime?;
    _idSintoma = snapshotData['id_sintoma'] as String?;
    _idNutriente = getDataList(snapshotData['id_nutriente']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('graficosSintomas');

  static Stream<GraficosSintomasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GraficosSintomasRecord.fromSnapshot(s));

  static Future<GraficosSintomasRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => GraficosSintomasRecord.fromSnapshot(s));

  static GraficosSintomasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GraficosSintomasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GraficosSintomasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GraficosSintomasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GraficosSintomasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GraficosSintomasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGraficosSintomasRecordData({
  String? nomeSintoma,
  String? userId,
  String? mesNome,
  int? mesNumero,
  int? ano,
  DateTime? dataCriacao,
  String? idSintoma,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nomeSintoma': nomeSintoma,
      'user_id': userId,
      'mes_nome': mesNome,
      'mes_numero': mesNumero,
      'ano': ano,
      'data_criacao': dataCriacao,
      'id_sintoma': idSintoma,
    }.withoutNulls,
  );

  return firestoreData;
}

class GraficosSintomasRecordDocumentEquality
    implements Equality<GraficosSintomasRecord> {
  const GraficosSintomasRecordDocumentEquality();

  @override
  bool equals(GraficosSintomasRecord? e1, GraficosSintomasRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nomeSintoma == e2?.nomeSintoma &&
        e1?.userId == e2?.userId &&
        e1?.mesNome == e2?.mesNome &&
        e1?.mesNumero == e2?.mesNumero &&
        e1?.ano == e2?.ano &&
        e1?.dataCriacao == e2?.dataCriacao &&
        e1?.idSintoma == e2?.idSintoma &&
        listEquality.equals(e1?.idNutriente, e2?.idNutriente);
  }

  @override
  int hash(GraficosSintomasRecord? e) => const ListEquality().hash([
        e?.nomeSintoma,
        e?.userId,
        e?.mesNome,
        e?.mesNumero,
        e?.ano,
        e?.dataCriacao,
        e?.idSintoma,
        e?.idNutriente
      ]);

  @override
  bool isValidKey(Object? o) => o is GraficosSintomasRecord;
}
