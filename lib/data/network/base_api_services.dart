abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(String url);

  Future<dynamic> getPostApiResponse(String url, dynamic data);

  Future<dynamic> getPostAuthApiResponse(String url, dynamic data);

  Future<dynamic> getPostMultipartAuthApiResponse(String url, dynamic data);

  Future<dynamic> getPostMultipartApiResponse(String url, dynamic data);

}
