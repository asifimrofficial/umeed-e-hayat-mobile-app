
import 'package:blood_donation_app/src/common_widgets/roundedButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/TextField.dart';
import '../../../constants/app_colors.dart';
import '../../../routing/route_name.dart';
import '../controllers/reset_password/reset_password_controller.dart';

class RestPassword extends StatefulWidget {
  const RestPassword({Key? key}) : super(key: key);

  @override
  State<RestPassword> createState() => _RestPasswordState();
}

class _RestPasswordState extends State<RestPassword> {
  late String email;
  ResetPasswordController resetPasswordController=Get.put(ResetPasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: true,
      
      body:Obx(()=>
       Center(
        child: Padding(
          padding: EdgeInsets.all(Get.height * 0.035),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               RoundedBorderFormField(
                    hintText: "Email",
                    leadingIcon: Icons.email,
                    keyBoardType: TextInputType.emailAddress,
                    controller: resetPasswordController.emailController(),
                  ),
                  const SizedBox(height: 20,),
                   RoundedBorderFormField(
                  leadingIcon: Icons.lock,
                  hintText: "New Password",
                  obscureText: resetPasswordController.isObscure.value,
                  controller: resetPasswordController.passwordController(),
                  suffixIcon: IconButton(onPressed: (){
                    resetPasswordController.isObscure.value=!resetPasswordController.isObscure.value;
                  }, icon: Icon(resetPasswordController.isObscure.value?Icons.visibility:Icons.visibility_off,
                  color:AppColors.mainColor,
                  size: 20,
                  )),
                ),
                 Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(onPressed: (){
                    Get.toNamed(RoutesName.login);
                  }, child: const Text("Login instead",style: TextStyle(color: Colors.red),)),
                ),
                Center(
                  child: RoundedButton(
                  text: "Reset Password",
                  height: Get.height * 0.05,
                  width: Get.width,
                  loading: resetPasswordController.loading.value,
                  onpress: () {
                    resetPasswordController.resetPasswordApi();
                  },
                    )
            
                       ,)
              ]),
        ),
      ),
      ),
    );
  }
}