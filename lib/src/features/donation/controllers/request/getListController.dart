import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../response/status.dart';
import '../../../../routing/route_name.dart';
import '../../../../utils/utils.dart';
import '../../models/requestListModel.dart';
import '../../respository/request/requestListRepository.dart';

class RequestListController extends GetxController{
  final _api= RequestListRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final rxRequestListModel = RequestList().obs;
  void setRxRequestStatus(Status status)=> rxRequestStatus.value= status;
  void setRxRequestList(RequestList requestListModel)=> rxRequestListModel.value= requestListModel;


  void getRequestList(){
      _api.getRequestList().then((value) => {
      setRxRequestStatus(Status.COMPLETED),
      setRxRequestList(value)
    }).onError((error, stackTrace) => {
      print("Error in get request list controller ${error.toString()}"),
      setRxRequestStatus(Status.ERROR)
    });

  }

}