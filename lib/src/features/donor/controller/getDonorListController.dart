import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../response/status.dart';
import '../models/Donors.dart';
import '../repository/listDonorsRepository.dart';


class DonorsController extends GetxController{
  final _api= DonorsListRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final rxDonorListModel = Donors().obs;
  void setRxRequestStatus(Status status)=> rxRequestStatus.value= status;
  void setRxRequestList(Donors donors)=> rxDonorListModel.value= donors;


  void getDonorsList(){
      _api.getDonorstList().then((value) => {
      setRxRequestStatus(Status.COMPLETED),
      setRxRequestList(value)
    }).onError((error, stackTrace) => {
      print(error.toString()),
      setRxRequestStatus(Status.ERROR)
    });

  }

}