import '../../../../network/NetworkApiService.dart';
import '../../../../constants/app_http_urls.dart';
class LoginRepository{
  final _apiServices= NetworkApiService();
  Future <dynamic>login(var data) async{
    final response = await _apiServices.post(AppUrl.loginUrl,data );
    // print(response);
    return response;
  }
}