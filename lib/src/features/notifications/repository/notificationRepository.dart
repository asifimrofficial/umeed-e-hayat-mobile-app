
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../exceptions/app_exception.dart';
class NotificationRepository{
@override
  Future post( body)async {
   print("IN POST REQUEST");
    dynamic responseJson;
    try{
      final response = await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'), 
      headers: {
        'Content-Type': 'application/json ; charset=UTF-8',
        'Authorization':'key=AAAA-0Cp3NM:APA91bFmwKf3FZN2ZTGpIrfrA-Ipdh29lvYbHUg9xrBs46W7Ju87e6ppiLhyqdGQ-wL6yhBbkVAx4c_ol3rzqEQgoKe7K0Ah0bCKRf0OxciyJzjQG5AYaNWpjG6PSPMH45ueuT_Zth13',
      }
      ,body: jsonEncode(body)).timeout(const Duration(seconds: 30));
      responseJson = response;
    }on SocketException{
      throw FetchDataException('No Internet connection');
    }
    return responseJson;

  }

}