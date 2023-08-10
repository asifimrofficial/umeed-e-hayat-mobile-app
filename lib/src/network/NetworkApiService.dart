
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../exceptions/app_exception.dart';
import '../network/BaseApiServices.dart';

class NetworkApiService extends BaseApiServices{
  @override
  Future delete(String url) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future get(String url) async {
    dynamic responseJson;
    try{
      final response = await http.get(Uri.parse(url),).timeout(const Duration(seconds: 30));
      responseJson = _returnResponse(response);
    }on SocketException{
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  @override
  Future post(String url, body)async {
   print("IN POST REQUEST");
    dynamic responseJson;
    try{
      final response = await http.post(Uri.parse(url), body: body).timeout(const Duration(seconds: 30));
      responseJson = _returnResponse(response);
    }on SocketException{
      throw FetchDataException('No Internet connection');
    }
    return responseJson;

  }
  //write function for put request
  @override
  Future put(String url, body)async {
    print("IN PUT REQUEST");
    dynamic responseJson;
    try{
      print("IN PUT REQUEST");
      final response = await http.put(Uri.parse(url), body: body).timeout(const Duration(seconds: 30));
      print("IN after PUT REQUEST");
      responseJson = _returnResponse(response);
    }on SocketException{
      throw FetchDataException('No Internet connection');
    }
    return responseJson;

  }


  dynamic _returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException('Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

}
  