import 'package:blood_donation_app/src/features/donation/screens/DonationRequestScreen.dart';
import 'package:blood_donation_app/src/features/donation/screens/createRequestScreen.dart';
import 'package:blood_donation_app/src/features/user/screens/profileScreen.dart';
import 'package:flutter/services.dart';

import 'src/common_widgets/bottomSheet.dart';
import 'src/features/authentication/screens/resetPasswordScreen.dart';
import 'src/features/donor/screens/searchDonor.dart';
import 'src/features/user/screens/contact_userScreen.dart';
import 'src/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  
  //only portrait mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Umeed e Hayat',
      theme: ThemeData(
        colorScheme:const  ColorScheme.light(
          primary: Colors.white,
        ),
        useMaterial3: true,
      ),
      // home:ContactUserScreen(phone:'3016691397'),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
