import '../../../../network/NetworkApiService.dart';
import '../../../../constants/app_http_urls.dart';
class CreateRequestRepository{
  final _apiServices= NetworkApiService();
  Future <dynamic>createRequest(var data) async{
    final response = await _apiServices.post(AppUrl.addRequestUrl,data );
    // print(response);
    return response;
  }
}