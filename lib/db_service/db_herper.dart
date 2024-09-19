import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

class DbHelper{
  Database? _database;

  Future<Database?> get database async{
    if(_database != null){
      return _database;
    }

    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "mydatabase.db");
    _database =
    await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE MyProfile (id INTEGER PRIMARY KEY, name TEXT, age INTEGER, num REAL, address TEXT)');
    });
    return _database;
  }

  insertData() async {
    Database? db = await database;
    db?.insert("MyProfile", {
      "name": "Flutter demo",
      "age": 22,
      "address": "dhaka 1207",
      "num": 12.5
    });
  }
}