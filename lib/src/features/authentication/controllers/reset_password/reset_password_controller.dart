import 'dart:math';

import 'package:blood_donation_app/src/features/authentication/controllers/user_preferences.dart/login_shared_pref.dart';
import 'package:blood_donation_app/src/features/authentication/models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routing/route_name.dart';
import '../../../../utils/utils.dart';
import '../../repository/reset password/reset_password_repository.dart';
import 'dart:convert';

import '../../screens/resetPasswordOtpScreen.dart';

class ResetPasswordController extends GetxController{
  final _api= ResetPasswordRepository();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxBool isObscure = true.obs;
  RxBool isPasswordVisible = true.obs;
  RxBool loading = false.obs;
  UserPreference userPreference=UserPreference();
  void resetPasswordApi(){
    loading.value=true;
    Map data={
      'email':emailController.value.text,
      'password':passwordController.value.text
    };
    _api.resetPasswordOTP(data).then((value) => {
      loading.value=false,
      Utils.SnackBar("Success", "Otp sent Successfulyl"),
      Get.to(()=>OtpScreen(email:value['data'])),
    }).onError((error, stackTrace) => {
      loading.value=false,
      Utils.SnackBar("Error", error.toString())
    });
  }
}