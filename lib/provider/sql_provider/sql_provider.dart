import 'package:sqflite/sqflite.dart';

abstract class SqlProvider<T>{
  final Database db ;
  final String tableName;


  SqlProvider(this.db, this.tableName);

  Future<int> insert (T row) ;
  Future<int> delete(T row);
  Future<int> update(T item) ;

  Future<List<T>> get select;

}