

import '../response/status.dart';

class ApiResponse<T>{
  Status? status;
  T? data;
  String? message;
  String? token;
  
  ApiResponse({this.status, this.data, this.message,this.token});

  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed() : status = Status.COMPLETED;
  ApiResponse.error() : status = Status.ERROR;
  ApiResponse.unauthorised() : status = Status.UNAUTHENTICATED;
  ApiResponse.unauthorisedRequest() : status = Status.UNAUTHORIZED;
  ApiResponse.unknown() : status = Status.UNKNOWN;
  

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data \n Token: $token" ;
  }
}