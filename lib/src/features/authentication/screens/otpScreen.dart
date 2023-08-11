import 'package:blood_donation_app/src/common_widgets/roundedButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_widgets/TextField.dart';
import '../../../constants/image_strings.dart';
import '../controllers/signUp/otp_controller.dart';

class OtpScreen extends StatefulWidget {
  var email;
  OtpScreen({Key? key, this.email}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpController = Get.put(OTPController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(AppImages.mainLogo),
              height: 120,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Please enter the OTP sent to your email " + widget.email,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            RoundedBorderFormField(
              autofillHints: const [AutofillHints.email],
              leadingIcon: Icons.email,
              hintText: "Email",
              controller: otpController.otpController(),
            ),
            const SizedBox(
              height: 20,
            ),
            RoundedButton(height: 50.0,
                  width: double.infinity,
                   text:"login",
                  loading: otpController.isloading.value,
                  onpress: () {
                    if(otpController.otpController().text.isEmpty ){
                      Get.snackbar("OTP", "Please enter OTP",duration: const Duration(seconds: 3),isDismissible: true);
                    }else{
                      otpController.verifyOTPApi(widget.email);
                    }
                  },),
          ],
        ),
      ),
    ));
  }
}
