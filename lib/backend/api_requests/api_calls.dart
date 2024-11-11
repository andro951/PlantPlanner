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
        'nb-results': 10,
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
  static List<String>? scientificName(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].species.scientificNameWithoutAuthor''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? commonNames(dynamic response) => getJsonField(
        response,
        r'''$.results[:].species.commonNames''',
        true,
      ) as List?;
  static List<String>? imageO(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].images[:].url.o''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetWeatherCall {
  static Future<ApiCallResponse> call({
    double? lat = 0.0000,
    double? lon = 0.0000,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetWeather',
      apiUrl:
          'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=d73d79f658e8f576a43ec532595553a4',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'lat': lat,
        'lon': lon,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static double? temperature(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.main.temp''',
      ));
  static double? humidity(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.main.humidity''',
      ));
  static dynamic rainFall(dynamic response) => getJsonField(
        response,
        r'''$.rain''',
      );
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
