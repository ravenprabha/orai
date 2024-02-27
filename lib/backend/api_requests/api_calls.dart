import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class NotionpageCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'notionpage',
      apiUrl:
          'https://api.notion.com/v1/blocks/580aefd635864dc487eb198c6dcbfc21/children?page_size=100',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer secret_ArBwIo1VP0gdMseP7KjZMGckznjqE9FfL0SxrjrX7V2',
        'Notion-Version': '2022-06-28',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DatabaseCall {
  static Future<ApiCallResponse> call({
    String? auth = '',
    String? pageid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'database',
      apiUrl: 'https://api.notion.com/v1/databases/${pageid}/query',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Notion-Version': '2022-06-28',
        'Authorization': '${auth}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].public_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].properties.post.title[:].plain_text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetaccesstokenCall {
  static Future<ApiCallResponse> call({
    String? code = '',
  }) async {
    final ffApiRequestBody = '''
{
  "grant_type": "authorization_code",
  "code": "${code}",
  "redirect_uri": "https://par.taaar.space/dbset"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getaccesstoken',
      apiUrl: 'https://api.notion.com/v1/oauth/token',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic YWQwZGQzYzYtNjQyMi00OTI2LTg0MWUtY2NlODcxNzJiNzQzOnNlY3JldF9hNXI4anRYZHA4UjNHMDVKczg3ajZRRmEwM05PSG4wYnNJbjdNeDRRSzJK',
        'Ccontent-type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? accesstoken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.access_token''',
      ));
  static String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.owner.user.person.email''',
      ));
  static String? pageid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.duplicated_template_id''',
      ));
}

class GETDBparaiCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GETDBparai',
      apiUrl: 'https://db.parai.space/i/cORo6HI1M3k/json',
      callType: ApiCallType.GET,
      headers: {
        'X-MicrofeedAPI-Key': 'af68cfeca4b1cf0b36eaf04b20ec3c75',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GETpresignedURLCall {
  static Future<ApiCallResponse> call({
    String? file = '',
  }) async {
    final ffApiRequestBody = '''
{
  "item_id": "thalaivar",
  "category": "image",
  "full_local_file_path": "${file}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GETpresignedURL',
      apiUrl: 'https://parai-space.pages.dev/api/media_files/presigned_urls/',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'X-MicrofeedAPI-Key': '6095fa60e7681dbda2945e9ec77725ee',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetcovodCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getcovod',
      apiUrl: 'https://paraidb1.wetarteam.workers.dev',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? data(dynamic response) => (getJsonField(
        response,
        r'''$..data.title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PostconvodCall {
  static Future<ApiCallResponse> call({
    String? text = '',
  }) async {
    final ffApiRequestBody = '''
{
  "title": "${text}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postconvod',
      apiUrl: 'https://db.parai.space/api/items/',
      callType: ApiCallType.POST,
      headers: {
        'X-MicrofeedAPI-Key': '6095fa60e7681dbda2945e9ec77725ee',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
