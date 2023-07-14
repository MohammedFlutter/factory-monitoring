class Department {
  String id;

  String? managerId;
  String address;

  Department.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        managerId = json['costOfProduction'],
        address = json['address'];

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "managerId": managerId,
      "address": address,
    };
  }
}
