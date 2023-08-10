import '../../../../network/NetworkApiService.dart';
import '../../../../constants/app_http_urls.dart';
class SignupRepository{
  final _apiServices= NetworkApiService();
  Future <dynamic>signup(var data) async{
    final response = await _apiServices.post(AppUrl.signupOTPUrl,data );
    print(response);
    return response;
  }
}