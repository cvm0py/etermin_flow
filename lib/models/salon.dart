class SalonModel {
  static List<Salon> grp = [];
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
  final String lng;
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
    required this.lng,
    required this.logo,
  });

  factory Salon.fromMap(Map<String, dynamic> map) {
    return Salon(
      id: map['id'] as int,
      name: map['name'] as String,
      address: map['address'] as String,
      city: map['city'] as String,
      neighbourhood: map['neighbourhood'] as String,
      zip: map['zip'] as String,
      isMen: map['isMen'] as bool,
      isWomen: map['isWomen'] as bool,
      isCat: map['isCat'] as bool,
      isDog: map['isDog'] as bool,
      email: map['email'] as String,
      phone: map['phone'] as String,
      lat: map['lat'] as String,
      lng: map['lng'] as String,
      logo: map['logo'] as String,
    );
  }

  toMap() => {
        "id": id,
        "name": name,
        "address": address,
        "city": city,
        "neighbourhood": neighbourhood,
        "zip": zip,
        "isMen": isMen,
        "isWomen": isWomen,
        "isCat": isCat,
        "isDog": isDog,
        "email": email,
        "phone": phone,
        "lat": lat,
        "lng": lng,
        "logo": logo
      };
}
