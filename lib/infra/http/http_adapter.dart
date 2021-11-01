import 'dart:io';

import 'package:dio/dio.dart';

import '../../data/http/http.dart';

class HttpAdapter implements HttpClient {
  Dio dio;

  HttpAdapter(this.dio);

  @override
  Future<Map<String, dynamic>> request(
    String url,
    HttpMethod method,  {
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? body,
  }) async {
    Response response;
    Options? options = Options(
      headers: headers,
    );

    switch (method) {
      case HttpMethod.GET:
        response = await dio.get(url, queryParameters: queryParameters, options: options);
        break;
      case HttpMethod.POST:
        response = await dio.post<Map<String, dynamic>>(url, data: body, queryParameters: queryParameters, options: options);
        break;
      case HttpMethod.PUT:
        response = await dio.get(url, queryParameters: queryParameters, options: options);
        break;
      case HttpMethod.DELETE:
        response = await dio.get(url, queryParameters: queryParameters, options: options);
        break;
    }

    return response.data;
  }
}
