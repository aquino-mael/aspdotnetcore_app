import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import '../../data/http/http.dart';

class HttpAdapter implements HttpClient {
  Dio dio;

  HttpAdapter(this.dio);

  @override
  Future<bool> deleteAsync(String url, String id) {
    // TODO: implement deleteAsync
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getAsync(String url, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(url, queryParameters: queryParameters);

      final jsonResponse = await jsonDecode(response.data);

      return jsonResponse;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<Map<String, dynamic>> postAsync(String url, Map<String, dynamic> data) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(url, data: data);

      final Map<String, dynamic> jsonResponse = response.data ?? {"success": false};

      return jsonResponse;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<Map<String, dynamic>> putAsync(String url, Map<String, dynamic> data) {
    // TODO: implement putAsync
    throw UnimplementedError();
  }
}
