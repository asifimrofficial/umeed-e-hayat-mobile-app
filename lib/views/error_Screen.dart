import 'package:flutter/material.dart';


class ErrorScreen extends StatelessWidget {
  final String message;
  const ErrorScreen({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: Container(
          child: Text(message), 

      ),
      ),
    );
  }
}
