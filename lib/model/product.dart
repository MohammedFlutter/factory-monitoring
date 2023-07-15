class Product {
  String id;
  String name;
  int? piece;
  int? cartoon;
  double? price;
  double? weight;
  double? costOfProduction;

  Product.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        price = json['price'],
        cartoon = json['cartoon'],
        piece = json['piece'],
        weight = json['weight'],
        costOfProduction = json['costOfProduction'];

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "piece": piece,
      "cartoon": cartoon,
      "price": price,
      "weight": weight,
      "costOfProduction": costOfProduction,
    };
  }
}

enum ProductType { cartoon, packet, piece }

ProductType productTypeFromJson(String json) => switch (json) {
      'cartoon' => ProductType.cartoon,
      'packet' => ProductType.packet,
      'piece' => ProductType.piece,
      _ => throw Exception('Invalid ItemType: $json')
    };
