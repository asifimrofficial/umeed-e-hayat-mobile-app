import '../../../../network/NetworkApiService.dart';
import '../../../../constants/app_http_urls.dart';
class ResetPasswordRepository{
  final _apiServices= NetworkApiService();

  Future <dynamic>resetPasswordOTP(var data) async{
    final response = await _apiServices.post(AppUrl.resetPasswordOtpUrl,data );
    return response;
  }
  Future <dynamic>resetPassword(Map<String, dynamic> data) async{
    // print("dh sdfd    sf"+data);
    final response = await _apiServices.post(AppUrl.resetPasswordUrl,data );
    // print(response);
    return response;
  }
}