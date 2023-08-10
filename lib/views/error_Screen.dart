import 'package:flutter/material.dart';


class ErrorScreen extends StatelessWidget {
  final String message;
  ErrorScreen({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Container(
          child: Text(message), 

      ),
      ),
    );
  }
}
