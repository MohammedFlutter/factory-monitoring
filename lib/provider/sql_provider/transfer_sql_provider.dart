// ignore_for_file: avoid_renaming_method_parameters

import 'package:factory_monitoring/model/transfer.dart';
import 'package:factory_monitoring/provider/sql_provider/sql_provider.dart';
import 'package:sqflite/sqflite.dart';

class TransferSqlProvider extends SqlProvider<Transfer> {
  TransferSqlProvider(Database db) : super(db, 'transfer');

  @override
  Future<int> delete(Transfer transfer) {
    return db.delete(tableName,
        where: 'driverId = ?,productId=?,departmentId=?,history=?',
        whereArgs: [
          transfer.driverId,
          transfer.productId,
          transfer.departmentId,
          transfer.history
        ]);
  }

  @override
  Future<int> insert(Transfer transfer) {
    return db.insert(tableName, transfer.toJson());
  }

  @override
  Future<List<Transfer>> get select async {
    var maps = await db.query(
      tableName,
    );
    return maps.map((e) => Transfer.fromJson(e)).toList();
  }

  @override
  Future<int> update(Transfer transfer) {
    return db.update(tableName, transfer.toJson(),
        where: 'driverId = ?,productId=?,departmentId=?,history=?',
        whereArgs: [
          transfer.driverId,
          transfer.productId,
          transfer.departmentId,
          transfer.history
        ]);
  }
}
