abstract class HttpClient {
  Future<Map<String, dynamic>> getAsync(String url, {Map<String, dynamic>? queryParameters});
  Future<Map<String, dynamic>> postAsync(String url, Map<String, dynamic> data);
  Future<Map<String, dynamic>> putAsync(String url, Map<String, dynamic> data);
  Future<bool> deleteAsync(String url, String id);
}
