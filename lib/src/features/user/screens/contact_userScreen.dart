import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common_widgets/roundedButton.dart';

class ContactUserScreen extends StatefulWidget {
  const ContactUserScreen({super.key});

  @override
  State<ContactUserScreen> createState() => _ContactUserScreenState();
}

class _ContactUserScreenState extends State<ContactUserScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        dragStartBehavior: DragStartBehavior.down,
        reverse: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           Image.asset(
              'assets/images/profile.png',
            ),
           const  SizedBox(
              height: 10,
            ),
            const Text(
              'Please briefly write your request \nor message.',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black45),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                cursorRadius: const Radius.circular(30),
                enableInteractiveSelection: true,
                cursorColor: Colors.red,
                decoration: InputDecoration(
                  hintText: 'Write your message here',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  helperText: 'Maximum 500 words',
                  helperStyle: TextStyle(
                      fontSize: 12), // Customize the helper text style
                ),
                maxLines: 6,
                maxLength: 300, // Maximum word limit
                buildCounter: (BuildContext context,
                    {required int currentLength,
                    required int? maxLength,
                    required bool isFocused}) {
                  return Text('$currentLength/$maxLength');
                },
              ),
            
            ),
            const SizedBox(
              height: 20,
            ),
            RoundedButton(height: 56, width: 360, text: 'Send message', onpress:(){},),
          ],
        ),
      ),
    );
  }
}
