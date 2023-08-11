
import '../../../constants/app_http_urls.dart';
import '../../../network/NetworkApiService.dart';
import '../models/userProfileModel.dart';
class UserProfileRepository{
  final _apiServices= NetworkApiService();


  Future <UserProfileModel>getUser(var id) async{
    print("IN GET USER RESPO ");
    final response = await _apiServices.get("${AppUrl.getUserUrl}/$id");
    print(response);
    return UserProfileModel.fromJson(response);
  }

  Future <UserProfileModel>updateUser(data,var id) async{
    print("IN UPDATE USER RESPO ");
    final response = await _apiServices.put("${AppUrl.updateUser}/$id", data);
    print(response);
    return UserProfileModel.fromJson(response);
  }

}