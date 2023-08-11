import 'package:blood_donation_app/src/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common_widgets/Buttons.dart';
import '../constants/app_colors.dart';

Widget modelBottomSheet(
    {required image,
    required String gender,
    required String name,
    required String location,
    required String bloodGroup ,
    required String donated,
    required onCallpressed,
    required onRequestPressed}
) {
  return Container(
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30))),
    height: Get.height / 2,
    width: Get.width,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: AppSizes.h10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                image,
                fit: BoxFit.fitHeight,
                 errorBuilder: (context, error, stackTrace) {
                                    if(gender== 'male')
                                      {
                                        return Image.asset(

                                      'assets/images/male_profile.png', // Replace 'path_to_alternate_image' with the path to your alternate image asset.
                                      fit: BoxFit.fitWidth,
                                    );
                                      }
                                    // The network image failed to load, show an alternate image.
                                    return Image.asset(

                                      'assets/images/female_profile.png', // Replace 'path_to_alternate_image' with the path to your alternate image asset.
                                      fit: BoxFit.fitWidth,
                                    );
                 },
              ),
            ),
          ),
          SizedBox(
            height: AppSizes.h5/2.5,
          ),
          Text(name,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
         SizedBox(
            height: AppSizes.h1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                size: Get.height * 0.02,
                color: AppColors.mainColor,
              ),
               Text(location,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            ],
          ),   
          SizedBox(
            height: AppSizes.h5/2.5,
          ),
           Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customeContainer(text: bloodGroup, heading: "Blood Group"),
                      customeContainer(text: donated, heading: "Times Donated"),
                     
                    ],
                  ),
          SizedBox(
            height: AppSizes.h5/2.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton.RoundedButtonWithImageText(
                  color:const Color.fromARGB(255, 42, 174, 189),
                  text: "Call",
                  onTap: onCallpressed,
                  image: "assets/images/call.png"),
              CustomButton.RoundedButtonWithImageText(
                  color: AppColors.mainColor,
                  text: "Message",
                  onTap: onRequestPressed,
                  image: "assets/images/message.png"),
            ],
          
          )
        ],
      ),
    ),
  );
}

Column customeContainer( {required String text, required String heading}) {
  return Column(
                      children: [
                        Text(text,
                            style: TextStyle(
                                fontSize: AppSizes.s1, fontWeight: FontWeight.bold,
                                color: AppColors.mainColor)),
                        SizedBox(
                          height: AppSizes.h1/2,
                        ),
                        Text(heading,
                            style: TextStyle(
                                fontSize: AppSizes.s1/2,
                                fontWeight: FontWeight.normal,
                               )),
                      ],
                    );
}
