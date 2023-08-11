import 'package:blood_donation_app/src/features/authentication/controllers/user_preferences.dart/login_shared_pref.dart';
import 'package:blood_donation_app/src/features/authentication/models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routing/route_name.dart';
import '../../../../utils/utils.dart';
import '../../repository/login/login_repository.dart';

class LoginController extends GetxController{
  final _api= LoginRepository();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxBool isObscure = true.obs;
  RxBool isPasswordVisible = true.obs;
  RxBool loading = false.obs;
  UserPreference userPreference=UserPreference();

  void loginApi(){
    loading.value=true;
    Map data={
      'email':emailController.value.text,
      'password':passwordController.value.text
    };
    _api.login(data).then((value) => {
      loading.value=false,
      Utils.SnackBar("login", "login Successfulyl"),
      userPreference.saveUser(UserModel.fromJson(value)),
      Get.toNamed(RoutesName.home)
    }).onError((error, stackTrace) => {
      loading.value=false,
      Utils.SnackBar("lError", error.toString())
    });
  }
}