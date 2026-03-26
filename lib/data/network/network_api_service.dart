import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 15));
      responseJson = returnResponse(response);
      print("✅ Response: $responseJson");
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }
  // bellow both is for without auth api...

  Future getPostApiResponse(String url, dynamic data) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      /// ✅ Headers
      request.headers.addAll({"Accept": "application/json"});

      /// ✅ Fields
      data.forEach((key, value) {
        request.fields[key] = value.toString();
      });

      print("📤 Sending Data: ${request.fields}");

      var streamedResponse = await request.send();

      var response = await http.Response.fromStream(streamedResponse);

      print("📥 Status Code: ${response.statusCode}");
      print("📥 Body: ${response.body}");

      if (response.statusCode == 200) {
        return returnResponse(response);
      } else {
        throw Exception("Server returned ${response.statusCode}");
      }
    } catch (e) {
      print("❌ Error: $e");
      rethrow;
    }
  }

  @override
  Future getPostMultipartApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll(Map<String, String>.from(data));

      http.StreamedResponse response = await request.send().timeout(
        const Duration(seconds: 15),
      );

      if (response.statusCode == 200) {
        final respStr = await response.stream.bytesToString();
        responseJson = jsonDecode(respStr); // parse JSON string
        print("✅ Multipart Response: $responseJson");
      } else {
        print("❌ Failed with status: ${response.statusCode}");
        throw Exception("Server returned ${response.statusCode}");
      }
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } catch (e) {
      print("⚠️ Exception in Multipart Request: $e");
      throw FetchDataException("Something went wrong");
    }
    return responseJson;
  }

  //bellow both are auth type method ...
  @override
  Future getPostAuthApiResponse(String url, dynamic data) async {
    String accessToken = '';
    final SharedPreferences sp = await SharedPreferences.getInstance();
    bool? loginIN = sp.getBool("isLogin");
    if (loginIN == true) {
      accessToken = sp.getString("access_token")!;
    }
    dynamic responseJson;
    try {
      Response response = await post(
        Uri.parse(url),
        headers: {'Authorization': accessToken},
        body: data,
      ).timeout(const Duration(seconds: 15));
      responseJson = returnResponse(response);
      print("✅ Response: $responseJson");
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostMultipartAuthApiResponse(
    String url,
    dynamic data, // keep as dynamic to match the base class
  ) async {
    String accessToken = '';
    final SharedPreferences sp = await SharedPreferences.getInstance();
    bool? loginIN = sp.getBool("isLogin");
    if (loginIN == true) {
      accessToken = sp.getString("access_token")!;
    }

    try {
      var headers = {'Authorization': accessToken};

      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll(Map<String, String>.from(data)); // cast here
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send().timeout(
        const Duration(seconds: 15),
      );

      if (response.statusCode == 200) {
        final respStr = await response.stream.bytesToString();
        print("✅ Response: $respStr");
        final decodedJson = jsonDecode(respStr);
        return decodedJson;
      } else {
        print("❌ Failed with status: ${response.statusCode}");
        throw Exception("Server returned ${response.statusCode}");
      }
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorizedException.UnauthorizedException(
          response.body.toString(),
        );
      default:
        throw FetchDataException(
          'Error occurred while communication with server with status code ${response.statusCode}',
        );
    }
  }
}
