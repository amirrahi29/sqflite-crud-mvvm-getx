import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;

class DBHelper{

  static Database? _db;

  Future<Database> get db async{
    if(_db != null)
      {
        return _db!;
      }
    _db = await initDatabase();
    return _db!;
  }

  initDatabase() async{
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path,'student.db');
    var db = openDatabase(path,version: 1,onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version){
    db.execute("CREATE TABLE student(id INTEGER PRIMARY KEY, name TEXT)");
  }

}