import 'package:blood_donation_app/src/features/authentication/controllers/user_preferences.dart/login_shared_pref.dart';
import 'package:blood_donation_app/src/features/user/screens/profileScreen.dart';
import 'package:blood_donation_app/src/routing/route_name.dart';
import 'package:blood_donation_app/src/routing/routes.dart';
import 'package:blood_donation_app/src/utils/utils.dart';
import 'package:blood_donation_app/views/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/image_strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserPreference userPreference=UserPreference();

     Future.delayed(Duration(seconds: 3), () {
      // userPreference.removeUser();
      
      userPreference.getUser().then((value){
        if( value!=null){
          print("user is logged in with id $value");
          Get.to(MainScreen());
          // Get.toNamed(RoutesName.donorProfile);
      }else{
        Get.toNamed(RoutesName.login);
      }
        
      }).onError((error, stackTrace) {
        Utils.SnackBar("Error", error.toString());
      });
      });
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: const Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image(
              fit: BoxFit.fitHeight,
              image: AssetImage(AppImages.splashScreenDesign),
            ),
          Positioned(
            child: Image(
              height: 200,
              image: AssetImage(AppImages.splashScreenLogo),
            ),
          ),
          
        ],
      ),
    );
  }
}
