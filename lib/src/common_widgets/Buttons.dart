// ignore: file_names
import 'package:blood_donation_app/src/constants/app_sizes.dart';
import 'package:flutter/material.dart';
class CustomButton {
  static Widget RoundedButtonWithImageText(
      {required Color? color, String? text, required onTap, required String? image}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        height: AppSizes.h5+2,
        width: AppSizes.w40+2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                AssetImage(image!),
                color: Colors.white,
                size: AppSizes.w5+2
              ),
               SizedBox(
                width: AppSizes.w5,
              ),
               Text(text!,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
