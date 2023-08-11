import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'src/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  
  //only portrait mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  
  print('Handling a background message ${message.messageId}');
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
