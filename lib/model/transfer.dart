import 'package:factory_monitoring/model/product.dart';

class Transfer {
  String driverId;
  String productId;
  String departmentId;
  String history;
  int amount;
  ProductType? type;

  Transfer.fromJson(Map<String, dynamic> json)
      : driverId = json['driverId'],
        productId = json['productId'],
        departmentId = json['departmentId'],
        history = json['history'],
        amount = json['amount'],
        type = productTypeFromJson(json['type']);

  Map<String, dynamic> toJson() {
    return {
      "driverId": driverId,
      "productId": productId,
      "history": history,
      "departmentId": departmentId,
      "amount": amount,
      "type": type.toString(),
    };
  }
}
