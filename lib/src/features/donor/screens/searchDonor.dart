import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../common_widgets/bottom_sheet_donor_details.dart';
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
    
  final Uri url = Uri.parse('tel:$phone');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
   
  }else{
     throw Exception('Could not launch $url');
  }
}
     @override
  void initState() {
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
          return const Center(child: CircularProgressIndicator());
          case Status.ERROR:
          return Text(donorsListController.rxRequestStatus.value.toString());
           case Status.COMPLETED:
           if(donorsListController.rxDonorListModel.value.data!.isEmpty){
             return const Center(child: Text("No Donors Available"));
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
                          );
        },
      );
           }
          default:
          return const Text("Something went wrong");
         }
      }),

    );
  }
}


