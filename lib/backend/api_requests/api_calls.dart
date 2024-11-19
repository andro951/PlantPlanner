import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class PlantIdentificationCall {
  static Future<ApiCallResponse> call({
    String? images = '',
    String? organ1 = 'leaf',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Plant Identification',
      apiUrl:
          'https://my-api.plantnet.org/v2/identify/all?include-related-images=true&no-reject=false&nb-results=10&lang=en&type=kt&api-key=2b10k0dN32PnU79DsEdMpLL',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'multipart/form-data',
      },
      params: {
        'images': images,
        'organ1': "leaf",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic bestMatch(dynamic response) => getJsonField(
        response,
        r'''$.bestMatch''',
      );
  static dynamic results(dynamic response) => getJsonField(
        response,
        r'''$.results''',
      );
  static dynamic commonNames(dynamic response) => getJsonField(
        response,
        r'''$.results[:].commonNames''',
      );
}

class GetPlantURLCall {
  static Future<ApiCallResponse> call({
    String? organ1 = 'leaf',
    String? imageURL = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetPlantURL',
      apiUrl: 'https://my-api.plantnet.org/v2/identify/all',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
      },
      params: {
        'images': imageURL,
        'organs': organ1,
        'include-related-images': true,
        'no-reject': true,
        'nb-results': 1,
        'type': "kt",
        'api-key': "2b10k0dN32PnU79DsEdMpLL",
        'lang': "en",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? bestMatch(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.bestMatch''',
      ));
  static List? commonNames(dynamic response) => getJsonField(
        response,
        r'''$.results[:].species.commonNames''',
        true,
      ) as List?;
  static List<String>? similarImage(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].images[:].url.o''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? resultspecies(dynamic response) => getJsonField(
        response,
        r'''$.results[:].species''',
        true,
      ) as List?;
}

class PermapeoplePlantByIdCall {
  static Future<ApiCallResponse> call({
    int? id = 0,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'permapeoplePlantById',
      apiUrl: 'https://permapeople.org/api/plants/$id',
      callType: ApiCallType.GET,
      headers: {
        'x-permapeople-key-id': 'Q50mL8YBTDCn',
        'x-permapeople-key-secret': '5548a3fa-9657-4a70-b50f-8df20910b130',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.name''',
      ));
  static String? slug(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.slug''',
      ));
  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static List<String>? dataKey(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].key''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dataValue(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? description(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.description''',
      ));
  static String? createdAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.created_at''',
      ));
  static String? updatedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.updated_at''',
      ));
  static String? scientificName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.scientific_name''',
      ));
  static int? version(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.version''',
      ));
  static String? type(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.type''',
      ));
  static String? link(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.link''',
      ));
  static dynamic images(dynamic response) => getJsonField(
        response,
        r'''$.images''',
      );
  static String? imagesThumb(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.images.thumb''',
      ));
  static String? imagesTitle(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.images.title''',
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
