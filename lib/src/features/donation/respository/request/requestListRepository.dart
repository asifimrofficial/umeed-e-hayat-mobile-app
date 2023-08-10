import '../../../../constants/app_http_urls.dart';
import '../../../../network/NetworkApiService.dart';
import '../../models/requestListModel.dart';
class RequestListRepository{
  final _apiServices= NetworkApiService();


  Future <RequestList>getRequestList() async{
    print("IN GET USER RESPO ");
    final response = await _apiServices.get(AppUrl.getRequestListUrl);
    final r=RequestList.fromJson(response);
    print(r.data![0].name);
    return RequestList.fromJson(response);
  }
}