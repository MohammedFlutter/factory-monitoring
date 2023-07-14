class Employee {
  String id;
  String? managerId;
  String name;
  double salary;

  Employee.formJson(Map json)
      : id = json['id'],
        managerId = json['managerId'],
        name = json['name'],
        salary = json['salary'];

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "managerId": managerId,
      "name": name,
      "salary": salary,
    };
  }
}
