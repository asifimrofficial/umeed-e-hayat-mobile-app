import 'package:blood_donation_app/src/features/donor/screens/searchDonor.dart';
import 'package:flutter/material.dart';
import 'package:blood_donation_app/src/common_widgets/bloodRequestTile.dart'
    as listTile;
import 'package:get/get.dart';

import '../../response/status.dart';
import '../../common_widgets/custom_dialog.dart';
import '../../common_widgets/clossingApp_Alert.dart';
import '../../routing/route_name.dart';
import '../donation/controllers/request/getListController.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final requestListController = Get.put(RequestListController());

  void initState() {
    // TODO: implement initState
    super.initState();
    requestListController.getRequestList();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:  () => onBackPressed(context),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Umeed-e-Hayat',
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 33),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                null;
              },
              icon: const Icon(
                Icons.notifications,
                color: Colors.red,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 177,
                    width: 374,
                    child: Image.asset(
                      'assets/images/umeedEHayat.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    padding: const EdgeInsets.all(20),
                    children: [
                      gridTileButton(
                          buttonText: 'Find Donor',
                          image: 'assets/images/ion_search.png',
                          // isEnabled: false,
                          onTap: () {
                            Get.to(SearchDonorScreen());
                          }),
                      gridTileButton(
                          buttonText: 'Donates',
                          image: 'assets/images/donates.png',
                          isEnabled: true,
                          onTap: () {
                            Get.toNamed(RoutesName.donationRequest);
                          }),
                      gridTileButton(
                          buttonText: 'Order Blood',
                          isEnabled: false,
                          image: 'assets/images/orderblood.png',
                          onTap: () {
                            //  Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateReuqest()));
                          }),
                      gridTileButton(
                          buttonText: 'Assistant',
                          isEnabled: false,
                          image: 'assets/images/assitant.png',
                          onTap: () {
                            print('Assistant');
                          }),
                      gridTileButton(
                          isEnabled: false,
                          buttonText: 'Reports',
                          image: 'assets/images/report.png',
                          onTap: () {
                            print('Find Donor');
                          }),
                      gridTileButton(
                          buttonText: 'Compaign',
                          image: 'assets/images/compaign.png',
                          isEnabled: false,
                          onTap: () {
                            Get.to(SearchDonorScreen());
                          }),
                    ],
                  ),
                ),
                Text("Donation Request",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Expanded(
                    flex: 1,
                    child: Obx(
                      () {
                        switch (requestListController.rxRequestStatus.value) {
                          case Status.LOADING:
                            return Center(child: CircularProgressIndicator());
                          case Status.ERROR:
                            return Text("Something went wrong");
                          case Status.COMPLETED:
                            return ListView.builder(
                              itemCount: requestListController
                                  .rxRequestListModel.value.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return listTile.listTile(
                                    requestListController.rxRequestListModel.value
                                        .data![index].name,
                                    requestListController.rxRequestListModel.value
                                        .data![index].location,
                                    requestListController.rxRequestListModel.value
                                        .data![index].bloodgroup,
                                    requestListController.rxRequestListModel.value
                                        .data![index].createdAt, () {
                                  showRequestDialog(
                                    context,
                                    requestListController
                                        .rxRequestListModel.value.data![index],
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        // Get.offAllNamed(RoutesName.home);
                                      },
                                      child: const Text(
                                        'OK',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                  );
                                });
                              },
                            );
                          default:
                            return Text("Something went wrong");
                        }
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

//  Widget gridTileButton(
  Widget gridTileButton({
    required String buttonText,
    required String image,
    required Function()?
        onTap, // Replace 'Function()' with the actual function type if needed.
    double opacity = 1.0,
    bool isEnabled = true, // Default is true, meaning the button is enabled.
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Opacity(
        opacity:
            isEnabled ? opacity : 0.5, // Lower opacity when button is disabled.
        child: GestureDetector(
          onTap: isEnabled
              ? onTap
              : null, // Set onTap to null when button is disabled.
          child: Container(
            height: 111,
            width: 111,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 223, 222, 222),
                  blurRadius: 5,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  height: 43,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  buttonText,
                  style:
                      const TextStyle(color: Color.fromARGB(255, 65, 64, 64)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
