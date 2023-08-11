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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = token;
    data['message'] = message;
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
    return id;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id']=id;
    data['name'] = name;
    data['email'] = email;
    data['city'] = city;
    data['contact'] = contact;
    data['bloodgroup'] = bloodgroup;
    data['gender'] = gender;
    data['isdonor'] = isdonor;
    if (image != null) {
      data['image'] = image!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['id'] = id;
    return data;
  }
}