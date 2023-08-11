import 'dart:convert';

import 'package:blood_donation_app/src/features/notifications/repository/notificationRepository.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../services/notification_services.dart';

class NotificationController extends GetxController {
  final context = Get.context!;
  final _api = NotificationRepository();
  final token = ''.obs;
  NotificationServices notificationServices = NotificationServices();
  void sendNotification(
      {required String title, required String body}) {
    notificationServices.getToken().then((value) => {
          _api.post({
            'to': value.toString(),
            'priority': 'high',
            'notification': {'title': title, 'body': body},
            'data': {'type':'msg'}
          }).then((value) => {print(value.body)}),
        });
  }

  void setupNotificationServices() {
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.requestNotificationPermission();

    notificationServices.isRefreshToken();
  }
}
