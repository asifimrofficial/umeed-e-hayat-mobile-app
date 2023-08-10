import 'package:blood_donation_app/src/features/authentication/controllers/user_preferences.dart/login_shared_pref.dart';
import 'package:blood_donation_app/src/features/authentication/models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../response/status.dart';
import '../../../routing/route_name.dart';
import '../../../utils/utils.dart';
import '../../user/repository/userProfileRepository.dart';
import '../models/userProfileModel.dart';

class UserProfileController extends GetxController{
   UserPreference userPreference=UserPreference();
  final _api= UserProfileRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final rxUserPorfileModel = UserProfileModel().obs;
  final RxBool isDonor = false.obs;
  void setRxRequestStatus(Status status)=> rxRequestStatus.value= status;
  void setRxUserProfile(UserProfileModel userProfileModel)=> rxUserPorfileModel.value= userProfileModel;
  final messageController = TextEditingController().obs;

  void getUser(){

    userPreference.getUser().then((value) => {
          print("printing user id${value}"),
      _api.getUser(value).then((value) => {
      setRxRequestStatus(Status.COMPLETED),
      setRxUserProfile(value),
      isDonor.value=value.data!.isdonor!
    }).onError((error, stackTrace) => {
      setRxRequestStatus(Status.ERROR)
    })
    }).onError((error, stackTrace) => {
      
    });

    
  }
  void updateUser(data){
    userPreference.getUser().then((value) => {
      print("printing user id blash ${value}"),
      _api.updateUser(data,value).then((value) => {
        setRxRequestStatus(Status.COMPLETED),
        setRxUserProfile(value),
        isDonor.value=value.data!.isdonor!
      }).onError((error, stackTrace) => {
        print("error in update user"+error.toString()),
        setRxRequestStatus(Status.ERROR)
      })
    }).onError((error, stackTrace) => {
      
    });
    
  }
   
  void uploadImage(){
    
  }

}