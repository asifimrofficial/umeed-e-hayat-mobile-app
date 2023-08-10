import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import '../../../../response/status.dart';
import '../../../../routing/route_name.dart';
import '../../../../utils/utils.dart';
import '../../repository/reset password/reset_password_repository.dart';

class ResetOTPController extends GetxController{
  final _api= ResetPasswordRepository();
    final isloading = false.obs;
  final otpController = TextEditingController().obs;
  void verifyResetPasswordOTPApi(email){
    print("email"+email);
    isloading.value=true;
    Map data={
      'email':email,
      'otp':otpController.value.text
    };
    print("mangho    -> ${data}");
    _api.resetPassword({
      'email':email,
      'otp':otpController.value.text
    }).then((value) => {


      print(value),
      isloading.value=false,
      // print(value),
      if(value['status']=="COMPLETED"){
        Utils.toastMessage("OTP Verified. Please Re login Again"),
        Get.toNamed(RoutesName.login),
      }else{
        Utils.SnackBar("Error", data['message'])
      }
    }).onError((error, stackTrace) => {
        isloading.value=false,
      print(error.toString()),
      Utils.SnackBar("Error", error.toString())
    });
  }

}