
import 'dart:io';
import 'dart:math';

import 'package:blood_donation_app/src/routing/route_name.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
class NotificationServices{
FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =FlutterLocalNotificationsPlugin();

void requestNotificationPermission()async{
  NotificationSettings settings = await firebaseMessaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  if(settings.authorizationStatus == AuthorizationStatus.authorized){
    print('User granted permission');
}

}

Future<String?> getToken() async{
  String? token = await firebaseMessaging.getToken();
   return token;
}
void isRefreshToken(){
  firebaseMessaging.onTokenRefresh.listen((event) {
    print("token is $event");
  });
}

void firebaseInit(BuildContext context){

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if(Platform.isAndroid){
      print("message is ${message.data['type']}}");
      initLocalNotifications(context,message);
      showNotification(message);
    }
    initLocalNotifications(context, message);
  if (message.notification != null) {
    print('Message also contained a notification: ${message.notification}');
  }
});
}

void initLocalNotifications(BuildContext context,RemoteMessage message)async {
  var androidinitializationSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');

  var initalizationSetting = InitializationSettings(android: androidinitializationSettings);

  await _flutterLocalNotificationsPlugin.initialize(
   initalizationSetting,
  onDidReceiveNotificationResponse: (payload) {
    handleMessage(context,message);
  },
  );
}

Future<void> setupInteractMessage(BuildContext context)async{
//when app is terminated
RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
if(initialMessage != null){
  handleMessage(context, initialMessage);
}

FirebaseMessaging.onMessageOpenedApp.listen((event) {
  handleMessage(context, event);
});

}

Future<void> showNotification(RemoteMessage message)async{
  AndroidNotificationChannel channel =  AndroidNotificationChannel(
    Random.secure().nextInt(1000000).toString(),
    'High Importance Notifications',
    description: 'channel description',
    importance: Importance.max,
    playSound: true,
    showBadge: true,
    enableVibration: true,
  );
  var android =  AndroidNotificationDetails(
    channel.id.toString(),
    channel.name.toString(),
    channelDescription: channel.description,
    priority: Priority.high,
    ticker: 'ticker',
    importance: Importance.high,
  );

  NotificationDetails notificationDetails = NotificationDetails(android: android);

  Future.delayed(Duration.zero, () async {
    await _flutterLocalNotificationsPlugin.show(
      0,
      message.notification!.title,
      message.notification!.body,
      notificationDetails,
      payload: message.data['route'],
    );
  });
}

void handleMessage(BuildContext context, RemoteMessage message){

    print('A new onMessageOpenedApp event was published!');
    print(message.data['type']);
    print(message.data['type']);
    if(message.data['type']=='msg')
    {
    Get.toNamed(RoutesName.donationRequest);
      print('in message data ##############');
    }
    // Navigator.pushNamed(context, message.data['route']);
  
}



}

