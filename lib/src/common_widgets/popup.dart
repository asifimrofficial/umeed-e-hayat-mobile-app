 import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';
 
 showErrorAlertDialog(BuildContext context, String message, onpressed) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          shape: RoundedRectangleBorder(
            
            borderRadius: BorderRadius.circular(20.0),
          ),
          content: Container(
            height:Get.height*0.4,
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 220,
                  child: Image.asset(
                    'assets/images/pana.png',     
                  ),
                ),
                const SizedBox(height: 10,),
                Text(message,
                style:const TextStyle(
                  color: Color.fromARGB(255, 26, 25, 25),
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                ),
                
                ),
                const SizedBox(height: 10,),
                 Container(
              width: Get.width*0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: AppColors.mainColor,
              ),
              child:onpressed
            )
              ],
            ),
          ),
          
        );
      },
    );
  }
