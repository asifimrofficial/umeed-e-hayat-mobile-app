import 'package:blood_donation_app/src/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../response/status.dart';
import '../../../routing/route_name.dart';
import '../../authentication/controllers/user_preferences.dart/login_shared_pref.dart';
import '../controllers/userProfileController.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final userProfileController = Get.put(UserProfileController());
  UserPreference userPreference = UserPreference();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userProfileController.getUser();
  }
   @override
  void dispose() {
    // Perform actions before the screen is closed
    // This is a good place to dispose of resources or save data

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Obx(() {
        switch (userProfileController.rxRequestStatus.value) {
          case Status.LOADING:
            return Center(child: CircularProgressIndicator(
              color: AppColors.mainColor ));
          case Status.ERROR:
            return const Text("Something went wrong");
          case Status.COMPLETED:
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Stack(
                              children: [
                            
                                Image.network(
                                  userProfileController
                                      .rxUserPorfileModel.value.data!.image!.url
                                      .toString(),
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) {
                                    if( userProfileController
                                      .rxUserPorfileModel.value.data!.gender== 'male')
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
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: AppColors.mainColor,
                                      
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        
                                      },
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // child: Image.network(
                            //   userProfileController.rxUserPorfileModel.value.data!.image!.url.toString(),

                            //   fit: BoxFit.fill,
                            // ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                            userProfileController
                                .rxUserPorfileModel.value.data!.name
                                .toString(),
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w800)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.location_on, size: 20),
                            Text(
                                userProfileController
                                    .rxUserPorfileModel.value.data!.city
                                    .toString(),
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600)),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(255, 42, 174, 189),
                              ),
                              height: 52,
                              width: 158,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/call.png',
                                    height: 26,
                                    width: 26,
                                    fit: BoxFit.fill,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text('Call Now',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.mainColor,
                              ),
                              height: 52,
                              width: 158,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/undo.png',
                                    height: 20,
                                    width: 20,
                                    fit: BoxFit.fill,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text('Request',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                    userProfileController.rxUserPorfileModel
                                        .value.data!.bloodgroup
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 5.5,
                                ),
                                const Text('Blood Group',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal)),
                              ],
                            ),
                           const  Column(
                              children: [
                                Text('55',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 5.5,
                                ),
                                Text('Donated',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal)),
                              ],
                            ),
                           const  Column(
                              children: [
                                Text('02',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 5.5,
                                ),
                                Text('Requested',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal)),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: double.infinity,
                      height: 55,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 222, 226, 226),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/carbon_event-schedule.png',
                            height: 26,
                            width: 26,
                            fit: BoxFit.fill,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text('Available for Donate',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54)),
                          const Spacer(),
                          Switch(
                            value: userProfileController.isDonor.value,
                            onChanged: (value) {
                              userProfileController.isDonor.value = value;
                              userProfileController.updateUser({
                                "isdonor": value.toString(),
                              });
                              // userProfileController.updateUser();
                            },
                            activeColor: Colors.red,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    actionTile(
                        image: 'assets/images/my_requests.png',
                          
                        text: 'My Requests',
                        onTap: () {

                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    actionTile(
                        image: 'assets/images/la_sign-out-alt.png',
                        text: 'Log Out',
                        onTap: () {
                          userPreference.removeUser();
                          Get.offAllNamed(RoutesName.login);
                        })
                  ],
                ),
              ),
            );
          default:
            return const Center(child: Text("default called"));
        }
      }),
    );
  }

  Widget actionTile({required image, required text, required onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55,
        padding: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 222, 226, 226),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              // 'assets/images/la_sign-out-alt.png',
              height: 26,
              width: 26,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(text,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}
