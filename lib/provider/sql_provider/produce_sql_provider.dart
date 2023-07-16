// ignore_for_file: avoid_renaming_method_parameters

import 'package:factory_monitoring/model/produce.dart';
import 'package:factory_monitoring/provider/sql_provider/sql_provider.dart';
import 'package:sqflite/sqflite.dart';

class ProduceSqlProvider extends SqlProvider<Produce> {
  ProduceSqlProvider(Database db) : super(db, 'produce');

  @override
  Future<int> delete(Produce produce) {
    return db.delete(tableName,
        where: 'employeeId = ?,productId=?,history=?',
        whereArgs: [produce.employeeId, produce.productId,produce.history]);
  }

  @override
  Future<int> insert(Produce produce) {
    return db.insert(tableName, produce.toJson());
  }

  @override
  Future<List<Produce>> get select async {
    var maps = await db.query(tableName);
    return maps.map((e) => Produce.fromJson(e)).toList();
  }

  @override
  Future<int> update(Produce produce) {
    return db.update(tableName, produce.toJson(),
        where: 'employeeId = ?,productId=?,history=?',
        whereArgs: [produce.employeeId, produce.productId,produce.history]);
  }
}
