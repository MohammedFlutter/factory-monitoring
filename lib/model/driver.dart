class Driver {
  String id;
  String name;

  Driver.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
    };
  }
}
