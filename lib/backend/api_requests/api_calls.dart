import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import '/backend/gemini/gemini_secrets.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class AddImageRecordCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? photo,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'addImageRecord ',
      apiUrl: 'https://xhlo-lkyx-rhhz.n7c.xano.io/api:u3LPse9C',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'photo': photo,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApigeminiCall {
  static Future<ApiCallResponse> call({
    String? meuPronpt = '',
  }) async {
    final ffApiRequestBody = '''
{
  "system_instruction": {
    "parts": [
      {
        "text": "Você é um assistente especializado em assistencia técnica do aplicativo. Responda apenas perguntas relacionadas a este tema. Se o usuário perguntar sobre outros assuntos (como esportes, política, tópicos sensiveis ou nutrição), recuse polidamente dizendo que não pode ajudar. Você não pode receitar nenhum tipo de medicamento ao usuario.  Mantenha um tom profissional e objetivo."
      }
    ]
  },
  "contents": [
    {
      "parts": [
        {
          "text": "${escapeStringForJson(meuPronpt)}"
        }
      ]
    }
  ],
  "generationConfig": {
    "temperature": 0.2,
    "maxOutputTokens": 1000,
    "topP": 0.8,
    "topK": 40
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'APIGEMINI',
      apiUrl:
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'X-goog-api-key': kGeminiApiKey,
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? textogerado(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.candidates[:].content.parts[:].text''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
