
import '../../../constants/app_http_urls.dart';
import '../../../network/NetworkApiService.dart';
import '../models/Donors.dart';

class DonorsListRepository{
  final _apiServices= NetworkApiService();


  Future <Donors>getDonorstList() async{
    print("IN GET USER RESPO ");
    final response = await _apiServices.get(AppUrl.getAllDonorsUrl);
    // print(response);
    print('HI');
    final donor= Donors.fromJson(response);
    print("donors legnth${donor.data!.length}");
    return Donors.fromJson(response);
  }
}