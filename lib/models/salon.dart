class SalonModel {
  static List<Salon> items = [
    
  ];
}

class Salon {
  final int id;
  final String name;
  final String address;
  final String city;
  final String neighbourhood;
  final String zip;
  final bool isMen;
  final bool isWomen;
  final bool? isCat;
  final bool? isDog;
  final String email;
  final String phone;
  final String lat;
  final String logo;

  Salon({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.neighbourhood,
    required this.zip,
    required this.isMen,
    required this.isWomen,
    required this.isCat,
    required this.isDog,
    required this.email,
    required this.phone,
    required this.lat,
    required this.logo,
  });

  factory Salon.fromMap(Map<String, dynamic> map) {
    return Salon(
      id: map['id'],
      name: map['name'],
      address: map['address'],
      city: map['city'],
      neighbourhood: map['neighbourhood'],
      zip: map['zip'],
      isMen: map['isMen'],
      isWomen: map['isWomen'],
      isCat: map['isCat'],
      isDog: map['isDog'],
      email: map['email'],
      phone: map['phone'],
      lat: map['lat'],
      logo: map['logo'],
    );
  }
}
