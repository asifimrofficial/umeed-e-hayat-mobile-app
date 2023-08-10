import 'package:blood_donation_app/src/features/donation/controllers/request/createRequestController.dart';
import 'package:blood_donation_app/test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common_widgets/bottomSheet.dart';
import '../../../common_widgets/donorListTile.dart';
import '../../../response/status.dart';
import '../../../routing/route_name.dart';
import '../controller/getDonorListController.dart';
class SearchDonorScreen extends StatefulWidget {
  const SearchDonorScreen({super.key});

  @override
  State<SearchDonorScreen> createState() => _SearchDonorScreenState();
}

class _SearchDonorScreenState extends State<SearchDonorScreen> {
  final donorsListController=Get.put(DonorsController());
  
  Future<void> _launchUrl(phone) async {
    
  final Uri _url = Uri.parse('tel:${phone}');
  if (await canLaunchUrl(_url)) {
    await launchUrl(_url);
   
  }else{
     throw Exception('Could not launch $_url');
  }
}
     @override
  void initState() {
    // TODO: implement initState
    super.initState();
    donorsListController.getDonorsList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Donors'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      
      body: Obx((){

         switch(donorsListController.rxRequestStatus.value){
          case Status.LOADING:
          return Center(child: CircularProgressIndicator());
          case Status.ERROR:
          return Text(donorsListController.rxRequestStatus.value.toString());
           case Status.COMPLETED:
           if(donorsListController.rxDonorListModel.value.data!.length==0){
             return Center(child: Text("No Donors Available"));
           }
           else{
           return ListView.builder(

        itemCount: donorsListController.rxDonorListModel.value.data!.length,
        itemBuilder: (BuildContext context, int index) {
          return listTile(onTap: (){
            Get.bottomSheet(modelBottomSheet(

                gender: donorsListController.rxDonorListModel.value.data![index].gender,
                image: donorsListController.rxDonorListModel.value.data![index].image , 
                name: donorsListController.rxDonorListModel.value.data![index].name, 
                location: donorsListController.rxDonorListModel.value.data![index].city, 
                bloodGroup: donorsListController.rxDonorListModel.value.data![index].bloodgroup,
                donated: donorsListController.rxDonorListModel.value.data![index].noOfDonations.toString(),
                onCallpressed: ()=>_launchUrl(donorsListController.rxDonorListModel.value.data![index].contact,
                
                ),
                onRequestPressed: ()=>Get.offNamed(RoutesName.requestDonor)
              )
              ,
           backgroundColor: Colors.transparent,
           isScrollControlled: true,
           elevation: 0.5);
          },
          gender:  donorsListController.rxDonorListModel.value.data![index].gender,
            image: donorsListController.rxDonorListModel.value.data![index].image,
            name: donorsListController.rxDonorListModel.value.data![index].name,
            location: donorsListController.rxDonorListModel.value.data![index].city,
            bloodGroup: donorsListController.rxDonorListModel.value.data![index].bloodgroup,
            
            // requestListController.rxRequestListModel.value.data![index].name, 
            // requestListController.rxRequestListModel.value.data![index].location, 
            // requestListController.rxRequestListModel.value.data![index].bloodgroup, 
            // requestListController.rxRequestListModel.value.data![index].createdAt, 
             
             );
        },
      );
           }
          default:
          return Text("Something went wrong");
         }
      }),

    );
  }
}


