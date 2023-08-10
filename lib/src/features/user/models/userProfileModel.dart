import 'dart:convert';
class UserProfileModel {
  String? status;
  UserData? data;
  String? message;

  UserProfileModel({this.status, this.data, this.message});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class UserData {
  String? name;
  String? email;
  String? city;
  String? contact;
  String? bloodgroup;
  String? gender;
  bool? isdonor;
  UserImage? image;

  UserData({
    this.name,
    this.email,
    this.city,
    this.contact,
    this.bloodgroup,
    this.gender,
    this.isdonor,
    this.image,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    city = json['city'];
    contact = json['contact'];
    bloodgroup = json['bloodgroup'];
    gender = json['gender'];
    isdonor = json['isdonor'];
    image = json['image'] != null ? UserImage.fromJson(json['image']) : null;
  }
}

class UserImage {
  String? url;
  String? id;

  UserImage({this.url, this.id});

  UserImage.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    id = json['id'];
  }
}
