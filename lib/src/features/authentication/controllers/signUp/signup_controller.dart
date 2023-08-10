import 'package:blood_donation_app/src/features/authentication/controllers/user_preferences.dart/login_shared_pref.dart';
import 'package:blood_donation_app/src/features/authentication/models/UserModel.dart';
import 'package:blood_donation_app/src/features/authentication/screens/otpScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common_widgets/popup.dart';
import '../../../../routing/route_name.dart';
import '../../../../utils/utils.dart';
import '../../repository/signup/signup_repository.dart';

class SignupController extends GetxController{
  final _api= SignupRepository();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final nameController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final bloodController = ''.obs;
  final genderController =''.obs;
  final cityController = TextEditingController().obs;
  final context = Get.context;
  RxBool isLoadig= false.obs;
    RxBool isObscure = true.obs;
     RxBool isPasswordVisible = true.obs;
  UserPreference userPreference=UserPreference();

  void signUpApi(){
    isLoadig.value=true;
    Map data={
      'name':nameController.value.text,
      'email':emailController.value.text,
      'password':passwordController.value.text,
      'contact':phoneController.value.text,
      'bloodgroup':bloodController.value,
      'gender':genderController.value,
      'city':cityController.value.text,
      'isdonor':'true'
    };
    _api.signup(data).then((value) => {
      isLoadig.value=false,
      if(value['status']=="COMPLETED"){
        isLoadig.value=false,
        Utils.SnackBar("Success", "Otp sent Successfulyl"),
        Get.to(()=>OtpScreen(email:value['data']))
      }else if(value['status']=="ERROR"){
        isLoadig.value=false,
         showErrorAlertDialog(
                      context!,
                       value['message'],
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
        // Utils.SnackBar("Email", value['message'])
      }

    }).onError((error, stackTrace) => {
      isLoadig.value=false,
      // print(error.toString())
      Utils.SnackBar("Error", error.toString())
    });
  }
}