
// ignore_for_file: avoid_renaming_method_parameters

import 'package:factory_monitoring/model/employee.dart';
import 'package:factory_monitoring/provider/sql_provider/sql_provider.dart';
import 'package:sqflite/sqflite.dart';

class EmployeeSqlProvider extends SqlProvider<Employee> {
  EmployeeSqlProvider(Database db):super(db,'employee');

  @override
  Future<int> delete(Employee employee) {
    return db.delete(tableName, where: 'id = ?', whereArgs: [employee.id]);
  }

  @override
  Future<int> insert(Employee employee) {
    return db.insert(tableName, employee.toJson());
  }

  @override
  Future<List<Employee>> get select async{
    var maps= await db.query(tableName);
    return maps.map((e) => Employee.fromJson(e)).toList();
  }

  @override
  Future<int> update(Employee employee) {
    return db.update(tableName, employee.toJson(),
        where: 'id= ?', whereArgs: [employee.id]);
  }
}
