import 'dart:convert';

import 'package:mvvm/networking/data/app_exceptions.dart';
import 'package:mvvm/networking/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  @override
  Future getGetAPIResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
      return responseJson;
    } catch (e) {
      throw FetchDataException(message: 'No Internet Exception');
    }
  }

  @override
  Future getPostAPIResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Map<String, String> headers = {'Content-Type': 'application/json'};
      dynamic response = await http
          .post(Uri.parse(url), body: data, headers: headers)
          .timeout(const Duration(seconds: 7));
      responseJson = returnResponse(response);
      return responseJson;
    } catch (e) {
      throw FetchDataException(message: 'No Internet Exception');
    }
  }

  dynamic returnResponse(dynamic response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        dynamic jsonResponse = jsonDecode(response.body)['error'].toString();
        throw BadRequestException(message: jsonResponse);
      case 404:
        throw PageNotFoundException(message: response.body);
      default:
        throw FetchDataException(
            message:
                'Error occured while fetching data from server. Code ${response.statusCode}');
    }
  }
}
