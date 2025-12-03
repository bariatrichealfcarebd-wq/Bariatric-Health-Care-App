// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PdfInfoStruct extends FFFirebaseStruct {
  PdfInfoStruct({
    String? nome,
    String? url,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nome = nome,
        _url = url,
        super(firestoreUtilData);

  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  static PdfInfoStruct fromMap(Map<String, dynamic> data) => PdfInfoStruct(
        nome: data['nome'] as String?,
        url: data['url'] as String?,
      );

  static PdfInfoStruct? maybeFromMap(dynamic data) =>
      data is Map ? PdfInfoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'nome': _nome,
        'url': _url,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
      }.withoutNulls;

  static PdfInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      PdfInfoStruct(
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PdfInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PdfInfoStruct && nome == other.nome && url == other.url;
  }

  @override
  int get hashCode => const ListEquality().hash([nome, url]);
}

PdfInfoStruct createPdfInfoStruct({
  String? nome,
  String? url,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PdfInfoStruct(
      nome: nome,
      url: url,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PdfInfoStruct? updatePdfInfoStruct(
  PdfInfoStruct? pdfInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pdfInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPdfInfoStructData(
  Map<String, dynamic> firestoreData,
  PdfInfoStruct? pdfInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pdfInfo == null) {
    return;
  }
  if (pdfInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && pdfInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pdfInfoData = getPdfInfoFirestoreData(pdfInfo, forFieldValue);
  final nestedData = pdfInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = pdfInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPdfInfoFirestoreData(
  PdfInfoStruct? pdfInfo, [
  bool forFieldValue = false,
]) {
  if (pdfInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pdfInfo.toMap());

  // Add any Firestore field values
  pdfInfo.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPdfInfoListFirestoreData(
  List<PdfInfoStruct>? pdfInfos,
) =>
    pdfInfos?.map((e) => getPdfInfoFirestoreData(e, true)).toList() ?? [];
