import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/dropDownButton.dart';
import '../../../common_widgets/roundedButton.dart';
import '../../../common_widgets/TextField.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/image_strings.dart';
import '../../../routing/route_name.dart';
import '../controllers/signUp/signup_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final signUpController = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Obx(() => Padding(
            padding: EdgeInsets.all(width * .1),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(AppImages.mainLogo),
                      height: height * .12,
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    const Text(
                      "You can donate for ones in need\nand request blood if you need.",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    RoundedBorderFormField(
                      leadingIcon: Icons.person,
                      hintText: "Name",
                      controller: signUpController.nameController(),
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    RoundedBorderFormField(
                      leadingIcon: Icons.email,
                      hintText: "Email",
                      controller: signUpController.emailController(),
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    RoundedBorderFormField(
                      leadingIcon: Icons.lock,
                      hintText: "Password",
                      obscureText: signUpController.isObscure.value,
                      controller: signUpController.passwordController(),
                      suffixIcon: IconButton(
                          onPressed: () {
                            signUpController.isObscure.value =
                                !signUpController.isObscure.value;
                          },
                          icon: Icon(
                              signUpController.isObscure.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppColors.mainColor)),
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    RoundedBorderFormField(
                      leadingIcon: Icons.phone,
                      hintText: "0301-6691397",
                      controller: signUpController.phoneController(),
                      keyBoardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
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
                        signUpController.bloodController.value =
                            newvalue ?? ""; // Handle potential null value
                      },
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    MyCustomDropdown(
                      hintText: "Select your gender",
                      leadingIcon: Icons.person_3,
                      items: const [
                        'Select your gender',
                        'male',
                        'female',
                        'other',
                      ],
                      value: "Select your gender",
                      onChanged: (newvalue) {
                        signUpController.genderController.value =
                            newvalue ?? ""; // Handle potential null value
                      },
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    RoundedBorderFormField(
                      leadingIcon: Icons.location_city,
                      hintText: "City",
                      controller: signUpController.cityController(),
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    RoundedButton(
                      loading: signUpController.isLoadig.value,
                      text: "Sign Up",
                      onpress: () {
                        if (signUpController.nameController().text.isEmpty ||
                            signUpController
                                .passwordController()
                                .text
                                .isEmpty ||
                            signUpController.emailController().text.isEmpty ||
                            signUpController.phoneController().text.isEmpty ||
                            signUpController.bloodController.value.isEmpty ||
                            signUpController.genderController.value.isEmpty ||
                            signUpController.cityController().text.isEmpty) {
                          Get.snackbar(
                              "Fields required", "Please enter all the details",
                              duration: const Duration(seconds: 2),
                              isDismissible: true);
                        } else {
                          signUpController.signUpApi();
                        }
                      },
                      height: height * .05,
                      width: width,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have Account?"),
                        TextButton(
                            onPressed: () {
                              Get.toNamed(RoutesName.login);
                            },
                            child: const Text(
                              "Sign In",
                              style: TextStyle(color: Colors.red),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
