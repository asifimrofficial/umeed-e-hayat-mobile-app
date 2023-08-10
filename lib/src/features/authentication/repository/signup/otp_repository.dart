import '../../../../network/NetworkApiService.dart';
import '../../../../constants/app_http_urls.dart';
class OTPRepository{
  final _apiServices= NetworkApiService();
  Future <dynamic>verifyOTP(var data) async{
    final response = await _apiServices.post(AppUrl.signupUrl,data );
    // print(response);
    return response;
  }
}