import 'package:blood_donation_app/src/features/authentication/screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';

import '../../../../common_widgets/popup.dart';
import '../../../../routing/route_name.dart';
import '../../../../utils/utils.dart';
import '../../repository/signup/otp_repository.dart';

class OTPController extends GetxController{
  final _api= OTPRepository();
  final otpController = TextEditingController().obs;
  final context= Get.context;
  final isloading = false.obs;
  void verifyOTPApi(email){
    isloading.value=true;
    Map data={
      'email':email,
      'otp':otpController.value.text
    };

    _api.verifyOTP(data).then((value) => {
      isloading.value=false,
      // print(value),
      if(value['status']=='COMPLETED'){
         showErrorAlertDialog(
                      context!,
                       "OTP Verified. Please Re login Again",
                      TextButton(
                        onPressed: () {
                          Navigator.of(context!).pop();
                        },
                        child: const Text(
                          'OK',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
        Utils.toastMessage("OTP Verified. Please Re login Again"),
        Get.toNamed(RoutesName.login),
      }else{
        isloading.value=false,
        Utils.SnackBar("Error", data['message'])
      }
      
    }).onError((error, stackTrace) => {
      // print(error.toString())
      Utils.SnackBar("Error", error.toString())
    });
  }
  
  // @override
  // void dispose() { // Don't forget to dispose of the TextEditingController
  //   super.dispose();
  // }

}