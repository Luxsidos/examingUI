import 'dart:core';
import 'package:example_for_examing/models/loginDatas.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:io' as io;

class DatabaseHelper {
  String _tableName = "pictures";
  String _picture = "picture";

  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();
  DatabaseHelper._internal();

  _createDatabase() async {
    io.Directory _documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(_documentsDirectory.path, "pictures.db");

    Database _db = await openDatabase(path, version: 1, onCreate: _createTable);

    return _db;
  }

  void _createTable(Database db, int version) async {
    await db
        .execute("CREATE TABLE IF NOT EXISTS $_tableName ( $_picture BLOB ) ");
  }

  _openDatabase() async {
    return _database ?? await _createDatabase();
  }

  insertPicture(LoginDatas data) async {
    Database _db = await _openDatabase();
    print("insert");

    return await _db.insert(_tableName, data.toMap());
  }

  Future<List<LoginDatas>> queryPicture() async {
    print("query");
    Database _db = await _openDatabase();

    List _results = await _db.query(_tableName);
    List<LoginDatas> _pictures = [];
    for (var picture in _results) {
      _pictures.add(LoginDatas(picture[_picture]));
    }
    print("SALOM: $_pictures");

    return _pictures;
  }
}
