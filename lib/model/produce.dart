import 'package:factory_monitoring/model/product.dart';

class Produce{
  String productId;
  String employeeId;
  String history;
  int amount;
  ProductType type;
  Produce.fromJson(Map<String, dynamic> json)
      : employeeId = json['employeeId'],
        productId = json['productId'],
        history = json['history'],
        amount = json['amount'],
        type = productTypeFromJson(json['type']);

  Map<String, dynamic> toJson() {
    return {
      "productId": productId,
      "employeeId": employeeId,
      "history": history,
      "amount": amount,
      "type": type,
    };
  }
}