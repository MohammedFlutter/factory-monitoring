// ignore_for_file: avoid_renaming_method_parameters

import 'package:factory_monitoring/model/store.dart';
import 'package:factory_monitoring/provider/sql_provider/sql_provider.dart';
import 'package:sqflite/sqflite.dart';

class StoreSqlProvider extends SqlProvider<Store> {
  StoreSqlProvider(Database db) : super(db, 'store');

  @override
  Future<int> delete(Store store) {
    return db.delete(tableName,
        where: 'departmentId = ?,productId=?',
        whereArgs: [store.departmentId, store.productId]);
  }

  @override
  Future<int> insert(Store store) {
    return db.insert(tableName, store.toJson());
  }

  @override
  Future<List<Store>> get select async {
    var maps = await db.query(tableName);
    return maps.map((e) => Store.fromJson(e)).toList();
  }

  @override
  Future<int> update(Store store) {
    return db.update(tableName, store.toJson(),
        where: 'departmentId = ?,productId=?',
        whereArgs: [store.departmentId, store.productId]);
  }
}
