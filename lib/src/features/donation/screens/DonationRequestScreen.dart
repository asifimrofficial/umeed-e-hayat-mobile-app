import 'package:blood_donation_app/src/common_widgets/bloodRequestTile.dart'
    as listTile;
import 'package:blood_donation_app/src/features/donation/controllers/request/getListController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_dialog.dart';
import '../../../response/status.dart';

class DonationRequestScreen extends StatefulWidget {
  const DonationRequestScreen({super.key});

  @override
  State<DonationRequestScreen> createState() => _DonationRequestScreenState();
}

class _DonationRequestScreenState extends State<DonationRequestScreen> {
  final requestListController = Get.put(RequestListController());
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestListController.getRequestList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text('Donation Request'),
           automaticallyImplyLeading: false,
            ),
        body: Obx(
          () {
            switch (requestListController.rxRequestStatus.value) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return const Text("Something went wrong");
              case Status.COMPLETED:
                return ListView.builder(
                  itemCount: requestListController
                      .rxRequestListModel.value.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return listTile.listTile(
                        requestListController
                            .rxRequestListModel.value.data![index].name,
                        requestListController
                            .rxRequestListModel.value.data![index].location,
                        requestListController
                            .rxRequestListModel.value.data![index].bloodgroup,
                       requestListController.rxRequestListModel.value
                            .data![index].createdAt, () {
                      showRequestDialog(
                        context,
                        requestListController
                            .rxRequestListModel.value.data![index],
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
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
                return const Text("Something went wrong");
            }
          },
        ));
  }
}
