// ignore_for_file: avoid_renaming_method_parameters

import 'package:factory_monitoring/model/product.dart';
import 'package:factory_monitoring/provider/sql_provider/sql_provider.dart';
import 'package:sqflite/sqflite.dart';

class ProductSqlProvider extends SqlProvider<Product> {
  ProductSqlProvider(Database db):super(db,'product');

  @override
  Future<int> delete(Product product) {
    return db.delete(tableName, where: 'id = ?', whereArgs: [product.id]);
  }

  @override
  Future<int> insert(Product product) {
    return db.insert(tableName, product.toJson());
  }

  @override
  Future<List<Product>> get select async{
    var maps= await db.query(tableName,);
    return maps.map((e) => Product.fromJson(e)).toList();
  }

  @override
  Future<int> update(Product product) {
    return db.update(tableName, product.toJson(),
        where: 'id= ?', whereArgs: [product.id]);
  }
}
