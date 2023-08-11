
class Donor {
  final String image;
  final int noOfDonations;
  final String id;
  final String name;
  final String bloodgroup;
  final String city;
  final String contact;
  final String gender;
  final bool isDonor;

  Donor({
    required this.image,
    required this.noOfDonations,
    required this.id,
    required this.name,
    required this.bloodgroup,
    required this.city,
    required this.contact,
    required this.gender,
    required this.isDonor,
  });
factory Donor.fromJson(Map<String, dynamic> json) {
  return Donor(
    image: json['image'] != null ? json['image']['url'] : '', // Provide a default value or handle the null case accordingly
    noOfDonations: json['noOfDonations'],
    id: json['_id'],
    name: json['name'],
    bloodgroup: json['bloodgroup'],
    city: json['city'],
    contact: json['contact'],
    gender: json['gender'],
    isDonor: json['isdonor'],
  );
}

  // factory Donor.fromJson(Map<String, dynamic> json) {
  //   return Donor(
  //     image: json['image']['url'] ,
  //     noOfDonations: json['noOfDonations'],
  //     id: json['_id'],
  //     name: json['name'],
  //     bloodgroup: json['bloodgroup'],
  //     city: json['city'],
  //     contact: json['contact'],
  //     gender: json['gender'],
  //     isDonor: json['isdonor'],
  //   );
  // }
}
class Donors {
  final String? status;
  final List<Donor>? data;

  Donors({
    this.status,
     this.data,
  });

  factory Donors.fromJson(Map<String, dynamic> json) {
    List<dynamic> donorsData = json['data'];
    List<Donor> donorsList = donorsData.map((donorJson) => Donor.fromJson(donorJson)).toList();

    return Donors(
      status: json['status'],
      data: donorsList,
    );
  }
}
