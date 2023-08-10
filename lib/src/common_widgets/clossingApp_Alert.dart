 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

  Future<bool> onBackPressed(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Container(
          alignment: Alignment.center,
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.red,
          ),
          child: const Text(
            'Exit App',
            style: TextStyle(
              color: Colors.white,
            ),
          ),

        ),
        content: const Text('Do you want to exit the app?',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          
        )
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false), // Stay in the app
            child: Container(
              alignment: Alignment.center,
              height: 30,
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(255, 3, 157, 62),
              ),
              child:const  Text('Cancel',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ))),
          ),
          TextButton(
            onPressed: () => SystemNavigator.pop(), // Exit the app
            child: Container(
             alignment: Alignment.center,
              height: 30,
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color.fromARGB(255, 252, 0, 0),
              ),
              child: Text('Exit',
              style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ))),
          ),
        ],
      ),
    ) ?? false;
  }

  // @override
  // Widget build(BuildContext context) {
  //   return WillPopScope(
  //     onWillPop: () => _onBackPressed(context),
  //     child: Scaffold(
  //       appBar: AppBar(
  //         title: Text('Main Screen'),
  //       ),
  //       body: Center(
  //         child: Text('Press back button to show alert.'),
  //       ),
  //     ),
  //   );
  // }
