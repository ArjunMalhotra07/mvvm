abstract class BaseApiService {
  Future<dynamic> getGetAPIResponse(String url);
  Future<dynamic> getPostAPIResponse(String url, dynamic data);
}
