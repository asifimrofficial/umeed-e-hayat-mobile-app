import 'package:flutter/material.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Open WhatsApp Intent Example')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // Replace '1234567890' with the desired phone number
              String phoneNumber = '+923171797662';

              AndroidIntent intent = AndroidIntent(
                action: 'action_view',
                package: 'com.whatsapp',
                componentName: 'com.whatsapp/.Main',
                data: 'https://wa.me/$phoneNumber',
                flags: [Flag.FLAG_ACTIVITY_NEW_TASK],
              );

              intent.launch();
            },
            child: Text('Open WhatsApp'),
          ),
        ),
      ),
    );
  }
}
