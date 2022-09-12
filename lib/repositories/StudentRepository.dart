import 'package:flutter_sqflite/database/DBHelper.dart';
import 'package:flutter_sqflite/database/Util.dart';
import 'package:flutter_sqflite/model/StudentModel.dart';

class StudentRepository{

  DBHelper dbHelper = DBHelper();

  Future<List<StudentModel>> getStudent() async{
    var dbClient = await dbHelper.db;
    List<Map> maps = await dbClient.query(tableName,columns: ['id','name']);
    List<StudentModel> student = [];
    for(int i = 0; i<maps.length; i++)
      {
        student.add(StudentModel.fromMap(maps[i]));
      }
    return student;
  }

  Future<int> add(StudentModel studentModel) async{
    var dbClient = await dbHelper.db;
    return await dbClient.insert(tableName, studentModel.toMap());
  }

  Future<int> update(StudentModel studentModel) async{
    var dbClient = await dbHelper.db;
    return await dbClient.update(tableName, studentModel.toMap(),
    where: 'id = ?', whereArgs: [studentModel.id]);
  }

  Future<int> delete(int id) async{
    var dbClient = await dbHelper.db;
    return await dbClient.delete(tableName,
        where: 'id = ?', whereArgs: [id]);
  }

}