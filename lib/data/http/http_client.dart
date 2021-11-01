import 'http_method.dart';

abstract class HttpClient {
  Future<Map<String, dynamic>> request(
    String url,
    HttpMethod method, {
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? body,
    });
}
