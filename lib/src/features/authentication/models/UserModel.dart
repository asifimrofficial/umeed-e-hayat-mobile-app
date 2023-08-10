import 'dart:convert';
class UserModel {
  String? status;
  Data? data;
  String? token;
  String? message;

  UserModel({this.status, this.data, this.token, this.message});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    token = json['token'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? email;
  String? city;
  String? contact;
  String? bloodgroup;
  String? gender;
  bool? isdonor;
  Image? image;

  Data({
    this.id,
    this.name,
    this.email,
    this.city,
    this.contact,
    this.bloodgroup,
    this.gender,
    this.isdonor,
    this.image,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id=json['id'];
    name = json['name'];
    email = json['email'];
    city = json['city'];
    contact = json['contact'];
    bloodgroup = json['bloodgroup'];
    gender = json['gender'];
    isdonor = json['isdonor'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
  }
  String? getID(){
    return this.id;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id']=this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['city'] = this.city;
    data['contact'] = this.contact;
    data['bloodgroup'] = this.bloodgroup;
    data['gender'] = this.gender;
    data['isdonor'] = this.isdonor;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }
}

class Image {
  String? url;
  String? id;

  Image({this.url, this.id});

  Image.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['id'] = this.id;
    return data;
  }
}