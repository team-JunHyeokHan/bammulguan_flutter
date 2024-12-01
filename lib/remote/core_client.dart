import 'dart:convert';

import 'package:http/http.dart' as http;

import 'base_response.dart';

class CoreClient {
  static Future<BaseResponse<T>> post<T>({
    required String url,
    Map<String, dynamic>? body,
    T Function(Map<String, dynamic>)? decoder,
    T Function(List<dynamic>)? listDecoder,
    bool sendToken = true,
  }) async {
    final headers = {
      'Content-Type': 'application/json; charset=utf-8',
    };

    var response = await http.post(
      Uri.parse(url),
      body: json.encode(body),
      headers: headers,
    );
    final responseBody = utf8.decode(response.bodyBytes);
    print(responseBody);

    final Map<String, dynamic> decodeJson =
    jsonDecode(utf8.decode(response.bodyBytes));

    return BaseResponse.fromJsons(
      decodeJson,
      decoder,
      fromJsonList: listDecoder,
    );
  }
}