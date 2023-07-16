
// ignore_for_file: avoid_renaming_method_parameters

import 'package:factory_monitoring/model/driver.dart';
import 'package:factory_monitoring/provider/sql_provider/sql_provider.dart';
import 'package:sqflite/sqflite.dart';

class DriverSqlProvider extends SqlProvider<Driver> {
  DriverSqlProvider(Database db):super(db,'driver');

  @override
  Future<int> delete(Driver driver) {
    return db.delete(tableName, where: 'id = ?', whereArgs: [driver.id]);
  }

  @override
  Future<int> insert(Driver driver) {
    return db.insert(tableName, driver.toJson());
  }

  @override
  Future<List<Driver>> get select async{
    var maps= await db.query(tableName);
    return maps.map((e) => Driver.fromJson(e)).toList();
  }

  @override
  Future<int> update(Driver driver) {
    return db.update(tableName, driver.toJson(),
        where: 'id= ?', whereArgs: [driver.id]);
  }
}
