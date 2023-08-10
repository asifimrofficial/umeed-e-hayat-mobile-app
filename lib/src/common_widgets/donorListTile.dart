import 'package:blood_donation_app/src/constants/app_colors.dart';
import 'package:blood_donation_app/src/routing/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';

Widget listTile(
    {String image = '',
    required String name,
    String location = '',
    String bloodGroup = '',
    required String gender,
    required onTap}) {
  return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: double.infinity,
          height: 112,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(2, 2), //(x,y)
                  blurRadius: 2.0,
                  blurStyle: BlurStyle.outer),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          padding: const EdgeInsets.only(left: 15),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              height: 80,
              width: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    if (gender == 'male') {
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
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      name,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainColor),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: AppColors.mainColor,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        flex: 1,
                        child: Text(
                          location,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                          // softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset(
                    'assets/images/Blood_Group.png',
                    height: 80,
                    width: 100,
                    fit: BoxFit.fitHeight,
                  ),
                  Positioned(
                    bottom: 18,
                    child: Text(
                      bloodGroup,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ));
}
