import 'package:blood_donation_app/src/features/donation/screens/DonationRequestScreen.dart';
import 'package:blood_donation_app/src/features/donor/screens/searchDonor.dart';
import 'package:blood_donation_app/src/features/user/screens/profileScreen.dart';
import 'package:blood_donation_app/views/MainScreen.dart';
import 'package:get/get.dart';
import '../features/authentication/screens/resetPasswordScreen.dart';
import '../features/donation/screens/createRequestScreen.dart';
import '../../src/routing/route_name.dart';
import '../features/authentication/screens/signupScreen.dart';
import '../features/authentication/screens/loginScreen.dart';
import '../features/authentication/screens/splashScreen.dart';
import '../features/user/screens/contact_userScreen.dart';


class AppRoutes{
  
  static appRoutes()=>[
    GetPage(
    name: RoutesName.splashScreen,
     page: ()=> const SplashScreen(),
     transition: Transition.native,
     transitionDuration:const Duration(milliseconds: 500)
     ),
    GetPage(
      name: RoutesName.login,
     page: ()=>const LoginScreen(),
     transition: Transition.native,
     transitionDuration: const Duration(milliseconds: 500)
     ),
    GetPage(
      name: RoutesName.signup,
     page: ()=>const SignupScreen(),
     transition: Transition.native,
     transitionDuration: const Duration(milliseconds: 500)
     ),
    GetPage(
      name: RoutesName.creatRequest,
     page: ()=>const CreateReuqest(),
     transition: Transition.native,
     transitionDuration: const Duration(milliseconds: 500)
     ),
    GetPage(
      name: RoutesName.home,
     page: ()=>const MainScreen(),
     transition: Transition.native,
     transitionDuration: const Duration(milliseconds: 500)
     ),
    GetPage(
      name: RoutesName.searchDonor,
     page: ()=>const SearchDonorScreen(),
     transition: Transition.native,
     transitionDuration:const Duration(milliseconds: 500)
     ),
    GetPage(
      name: RoutesName.donorProfile,
     page: ()=> const UserProfile(),
     transition: Transition.native,
     transitionDuration:const Duration(milliseconds: 500)
     ),
    GetPage(
      name: RoutesName.resetPassword,
     page: ()=> const RestPassword(),
     transition: Transition.native,
     transitionDuration:const Duration(milliseconds: 500)
     ),
    GetPage(
      name: RoutesName.donationRequest,
     page: ()=> const DonationRequestScreen(),
     transition: Transition.native,
     transitionDuration:const Duration(milliseconds: 500)
     ),
    GetPage(
      name: RoutesName.requestDonor,
     page: ()=> const ContactUserScreen(),
     transition: Transition.native,
     transitionDuration:const Duration(milliseconds: 500)
     ),
  ];

  
}