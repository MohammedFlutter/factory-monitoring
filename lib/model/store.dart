import 'package:factory_monitoring/model/product.dart';

class Store{
  String productId;
  String departmentId;
  int amount;
  ProductType type;
  Store.fromJson(Map<String, dynamic> json)
      : departmentId = json['departmentId'],
        productId = json['productId'],
        amount = json['amount'],
        type = productTypeFromJson(json['type']);

  Map<String, dynamic> toJson() {
    return {
      "productId": productId,
      "departmentId": departmentId,
      "amount": amount,
      "type": type,
    };
  }
}