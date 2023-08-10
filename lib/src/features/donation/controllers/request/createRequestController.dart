import 'package:blood_donation_app/src/features/authentication/controllers/user_preferences.dart/login_shared_pref.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common_widgets/popup.dart';
import '../../../../routing/route_name.dart';
import '../../../../utils/utils.dart';
import '../../respository/request/createRequestRepository.dart';
// import '../../repository/signup/signup_repository.dart';

class CreateRequestController extends GetxController {
  UserPreference userPreference = UserPreference();

  final _api = CreateRequestRepository();
  final locationController = TextEditingController().obs;
  final hospitalController = TextEditingController().obs;
  final nameController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final bloodController = ''.obs;
  final noteController = TextEditingController().obs;
  final hbController = TextEditingController().obs;
  final context = Get.context;
  void creatRequestApi() {
    userPreference.getUser().then((value) => {
          _api
              .createRequest({
                'user': value,
                'name': nameController.value.text,
                'contact': phoneController.value.text,
                'bloodgroup': bloodController.value,
                'location': locationController.value.text,
                'hospital': hospitalController.value.text,
                'note': noteController.value.text,
                'hb': hbController.value.text,
                'isdonor': 'true'
              })
              .then((value) => {
                    showErrorAlertDialog(
                      context!,
                      "Request Created Successfully",
                      TextButton(
                        onPressed: () {
                          Navigator.of(context!).pop();
                          Get.offAllNamed(RoutesName.home);
                        },
                        child: const Text(
                          'OK',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    // Utils.SnackBar("Success", "Request Created Successfully"),
                    // Get.offAllNamed(RoutesName.home)
                  })
              .onError((error, stackTrace) => {
                    // print(error.toString())
                    Utils.SnackBar("Error", error.toString())
                  }),
        });
  }
}

class RouteName {}
