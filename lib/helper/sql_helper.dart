import 'package:factory_monitoring/constant/strings.dart';
import 'package:sqflite/sqflite.dart';

class SqlHelper{
  static  Database? _db;


  Future<Database> get db async {
  if (_db != null) {
  return _db!;
  }
  _db = await initialDb();
  return _db!;
  }

  Future<Database> initialDb() async {

  return await openDatabase('items.db',version:1 ,onCreate:_onCreate );
  }

  _onCreate(Database db, int version)async {
  await db.execute(Strings.sqlCreation);
  }


  Future<void> close () async{
  final mydb= await db;
  await mydb.close();
  }


}