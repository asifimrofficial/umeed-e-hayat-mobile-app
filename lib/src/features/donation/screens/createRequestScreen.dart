import 'package:blood_donation_app/src/common_widgets/roundedButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/TextField.dart';
import '../../../common_widgets/dropDownButton.dart';
import '../controllers/request/createRequestController.dart';

class CreateReuqest extends StatefulWidget {
  const CreateReuqest({super.key});

  @override
  State<CreateReuqest> createState() => _CreateReuqestState();
}

class _CreateReuqestState extends State<CreateReuqest> {
  final creatRequestController = Get.put(CreateRequestController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Create A Request"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedBorderFormField(
                leadingIcon: Icons.person,
                hintText: "Name",
                controller: creatRequestController.nameController(),
              ),
              const SizedBox(height: 20),
              RoundedBorderFormField(
                leadingIcon: Icons.location_on,
                hintText: "City",
                controller: creatRequestController.locationController(),
              ),
              const SizedBox(height: 20),
              RoundedBorderFormField(
                leadingIcon: Icons.maps_home_work,
                hintText: "Hospital Name",
                controller: creatRequestController.hospitalController(),
              ),
              const SizedBox(height: 20),
              MyCustomDropdown(
                hintText: "Select your blood group",
                leadingIcon: Icons.bloodtype,
                items: const [
                  'Select your blood group',
                  'A+',
                  'A-',
                  'B+',
                  'B-',
                  'AB+',
                  'AB-',
                  'O+',
                  'O-',
                ],
                value: "Select your blood group",
                onChanged: (newvalue) {
                  creatRequestController.bloodController.value =
                      newvalue ?? ""; // Handle potential null value
                },
              ),
              const SizedBox(height: 20),
              RoundedBorderFormField(
                keyBoardType: TextInputType.number,
                leadingIcon: Icons.format_list_numbered,
                hintText: "HB Level",
                controller: creatRequestController.hbController(),
              ),
              const SizedBox(height: 20),
              RoundedBorderFormField(
                keyBoardType: TextInputType.number,
                leadingIcon: Icons.phone,
                hintText: "0301-6691397",
                controller: creatRequestController.phoneController(),
              ),
              const SizedBox(height: 20),
              RoundedBorderFormField(
                lines: 2,
                leadingIcon: Icons.notes,
                hintText: "Additional Notes",
                controller: creatRequestController.noteController(),
              ),
              const SizedBox(height: 20),
              RoundedButton(
                text: "Create Request",
                onpress: () {
                  if (creatRequestController.nameController().text.isEmpty ||
                      creatRequestController.locationController().text.isEmpty ||
                      creatRequestController.phoneController().text.isEmpty ||
                      creatRequestController.bloodController.value.isEmpty ||
                      creatRequestController.hospitalController().text.isEmpty ||
                      creatRequestController.nameController().text.isEmpty ||
                      creatRequestController.hbController().text.isEmpty) {
                    Get.snackbar(
                        "Fields required", "Please enter all the details",
                        duration: const Duration(seconds: 2),
                        isDismissible: true);
                  } else {
                  creatRequestController.creatRequestApi();
                  }
                },
                height: 50.0,
                width: double.infinity,
              ),
              // CustomButton.roundedButton(
              //   text: "Create Request",
              //   onpress: () {
              //     creatRequestController.creatRequestApi();
              //   },
              //   height: 50.0,
              //   width: double.infinity,
              // )
            ],
          ),
        ),
      ),
    ));
  }
}
