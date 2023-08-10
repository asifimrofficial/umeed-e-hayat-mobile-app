import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';
import '../features/donation/models/requestListModel.dart';

void showRequestDialog(
    BuildContext context, RequestItem requestItem, onpressed) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          
        ),
        title: const Text("Request Details"),
        content: SizedBox(
          height: Get.height * 0.5,
          width: Get.width,
          child: Column(
            children: [
              detail_rows('Name', requestItem.name),
              const SizedBox(
                height: 10,
              ),
              detail_rows('Location', requestItem.location),
              const SizedBox(
                height: 10,
              ),
              detail_rows('Hospital', requestItem.hospital),
              const SizedBox(
                height: 10,
              ),
              detail_rows('HB Level', requestItem.hb.toString()),
              const SizedBox(
                height: 10,
              ),
              detail_rows('contact', requestItem.contact),
              const SizedBox(
                height: 10,
              ),
              detail_rows('Fulfilled', requestItem.isfulfilled.toString()),
              const SizedBox(
                height: 10,
              ),
              
              const SizedBox(
                height: 10,
              ),
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

Container detail_rows(key,value) {
  return Container(
              height: 50,
              width: Get.width,

              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      '${key}: ',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 20),
                    ),
                    Text(
                      value,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            );
}
