import 'package:blood_donation_app/src/features/authentication/models/UserModel.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
class UserPreference extends GetxController{
  Future <bool>saveUser(UserModel userModel)async{
    SharedPreferences sp= await SharedPreferences.getInstance();
    String userId= userModel.data!.getID()!;
    // print(userId);
    sp.setString("userid", userId);

    return true;
  }
   Future <dynamic>getUser()async{
    SharedPreferences sp= await SharedPreferences.getInstance();
    String? userid =sp.getString('userid');
    print("in get user $userid");
    if(userid!= null)
    {   
    return userid;
    }
    return null;
  }

  Future<bool> removeUser()async{
    SharedPreferences sp= await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}