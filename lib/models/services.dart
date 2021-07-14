class ServicesModel {
  static List<dynamic> items = [];
}

class Item {
  final int id;
  final String name;
  final String description;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.description,
      required this.image});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      description: map["description"],
      image: map["logo"],
    );
  }

  toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "logo": image,
      };
}
