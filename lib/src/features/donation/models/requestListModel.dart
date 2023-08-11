
class RequestList {
  bool? stauts;
  String? message;
  List<RequestItem>? data;

  RequestList({
    this.stauts,
    this.message,
    this.data,
  });

  factory RequestList.fromJson(Map<String, dynamic> json) {
    return RequestList(
      stauts: json['stauts'],
      message: json['message'],
      data: List<RequestItem>.from(
        json['data'].map((item) => RequestItem.fromJson(item)),
      ),
    );
  }
}

class RequestItem {
  String id;
  String bloodgroup;
  String name; // Added 'name' field
  String location;
  String hospital;
  String contact;
  bool isactive;
  bool isfulfilled;
  double hb;
  String user;
  String note;
  String createdAt;
  String updatedAt;

  RequestItem({
    required this.id,
    required this.bloodgroup,
    required this.name, // Added 'name' field
    required this.location,
    required this.hospital,
    required this.contact,
    required this.isactive,
    required this.isfulfilled,
    required this.hb,
    required this.user,
    required this.note,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RequestItem.fromJson(Map<String, dynamic> json) {
    return RequestItem(
      id: json['_id'],
      bloodgroup: json['bloodgroup'],
      name: json['name'], // Added 'name' field
      location: json['location'],
      hospital: json['hospital'],
      contact: json['contact'],
      isactive: json['isactive'],
      isfulfilled: json['isfulfilled'],
      hb: json['hb'],
      user: json['user'],
      note: json['note'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
