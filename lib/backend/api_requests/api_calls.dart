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
    String? organ1,
    String? imageURL = '',
  }) async {
    organ1 ??= FFDevEnvironmentValues().organfeature;

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
  static List<String>? commonNames(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].species.commonNames''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
  static List<String>? msimimg(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].images[:].url.m''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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

class PlantDiseaseIdentificationnCall {
  static Future<ApiCallResponse> call({
    String? imageDisease = '',
  }) async {
    final ffApiRequestBody = '''
{
  "images": [
    "{{${escapeStringForJson(imageDisease)}}}"
  ],
  "latitude": 49,
  "longitude": 16.608,
  "similar_images": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PlantDiseaseIdentificationn',
      apiUrl:
          'https://plant.id/api/v3/health_assessment?language=en&full_disease_list=true&details=local_name,description,url,treatment,classification,common_names,cause',
      callType: ApiCallType.POST,
      headers: {
        'Api-Key': 'g6wfU0kd9oJUXEDMRzsnvhy1H0iHOIWHkGF5ktDB094tiUqCOW',
        'Content-Type': 'Application/json',
        'Content-Length': '<calculated when request is sent>',
        'Host': '<calculated when request is sent>',
        'User-Agent': 'PostmanRuntime/7.42.0',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
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
}

class PlantDiseaseIdentificationCall {
  static Future<ApiCallResponse> call({
    String? plant = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'PlantDiseaseIdentification',
      apiUrl:
          'https://perenual.com/api/pest-disease-list?key=sk-IrjG674e34191ac9a7858',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'Key': "sk-IrjG674e34191ac9a7858",
        'Page': 1,
        'ID': 0,
        'q': plant,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? commonNames(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].common_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? scientificName(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].scientific_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? describedisease(dynamic response) => getJsonField(
        response,
        r'''$.data[:].description''',
        true,
      ) as List?;
  static List<String>? questiondisease(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].description[:].subtitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? detaildisease(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].description[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? diseasehost(dynamic response) => getJsonField(
        response,
        r'''$.data[:].host''',
        true,
      ) as List?;
  static List<String>? thumbnailimage(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].images[:].thumbnail''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? diseasesecure(dynamic response) => getJsonField(
        response,
        r'''$.data[:].solution''',
        true,
      ) as List?;
  static List<String>? longSolution(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].solution[:].subtitle''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? easySolution(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].solution[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
