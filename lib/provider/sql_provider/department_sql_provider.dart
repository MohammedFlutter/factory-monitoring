
// ignore_for_file: avoid_renaming_method_parameters

import 'package:factory_monitoring/model/department.dart';
import 'package:factory_monitoring/provider/sql_provider/sql_provider.dart';
import 'package:sqflite/sqflite.dart';

class DepartmentSqlProvider extends SqlProvider<Department> {
  DepartmentSqlProvider(Database db):super(db,'department');

  @override
  Future<int> delete(Department department) {
    return db.delete(tableName, where: 'id = ?', whereArgs: [department.id]);
  }

  @override
  Future<int> insert(Department department) {
    return db.insert(tableName, department.toJson());
  }

  @override
  Future<List<Department>> get select async{
    var maps= await db.query(tableName);
    return maps.map((e) => Department.fromJson(e)).toList();
  }

  @override
  Future<int> update(Department department) {
    return db.update(tableName, department.toJson(),
        where: 'id= ?', whereArgs: [department.id]);
  }
}
