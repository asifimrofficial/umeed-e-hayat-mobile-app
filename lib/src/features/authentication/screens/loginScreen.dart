import 'package:blood_donation_app/src/constants/app_colors.dart';
import 'package:blood_donation_app/src/features/authentication/controllers/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/Buttons.dart';
import '../../../common_widgets/TextField.dart';
import '../../../common_widgets/roundedButton.dart';
import '../../../constants/image_strings.dart';
import '../../../routing/route_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginVM=Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Obx(()=>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal:40.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                const Image(image: 
                AssetImage(AppImages.mainLogo),
                height: 120,
                ),
               const  SizedBox(height: 20,),
               const Text("You can donate for ones in need\nand request blood if\nyou need.",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20,),
                RoundedBorderFormField(
                  autofillHints: const [AutofillHints.email],
                  leadingIcon: Icons.email,
                  hintText: "Email",
                  controller: loginVM.emailController(),
                ),
               const SizedBox(height: 20,),
               RoundedBorderFormField(
                  leadingIcon: Icons.lock,
                  hintText: "Password",
                  obscureText: loginVM.isObscure.value,
                  controller: loginVM.passwordController(),
                  suffixIcon: IconButton(onPressed: (){
                    loginVM.isObscure.value=!loginVM.isObscure.value;
                  }, icon: Icon(loginVM.isObscure.value?Icons.visibility:Icons.visibility_off,
                  color:AppColors.mainColor,
                  size: 20,
                  )),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(onPressed: (){
                    Get.toNamed(RoutesName.resetPassword);
                  }, child: const Text("Forgot Password?",style: TextStyle(color: Colors.red),)),
                ),
               
                  RoundedButton(height: 50.0,
                  width: double.infinity,
                   text:"login",
                  loading: loginVM.loading.value,
                  onpress: () {
                    if(loginVM.emailController().text.isEmpty ){
                      Get.snackbar("Email", "Please enter email",duration: const Duration(seconds: 2),isDismissible: true);
                    }else if(loginVM.passwordController().text.isEmpty){
                      Get.snackbar("Password", "Please enter password");
                    }else{
                    loginVM.loginApi();
                    }
                  },),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     const Text("Don't have an account?"),
                    TextButton(onPressed: (){
                      Get.toNamed(RoutesName.signup);
                    }, child: const Text("Sign Up",style: TextStyle(color: Colors.red),))
                  ],
                )
              ],
            ),
          ),
        ),
      ),

      ),
    );
  }
}