import 'package:flutter/services.dart';
import 'package:flutter_delivery/models/models.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "shop.db";
  static const _databaseVersion = 1;

  static Future<Database> db() async {
    return openDatabase(
      _databaseName,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  static Future _onCreate(Database db, int version) async {
    String script = await rootBundle.loadString("assets/db/scripts.sql");
    List<String> scripts = script.split(";");

    for (var element in scripts) {
      if (element.isNotEmpty) {
        db.execute(element.trim());
      }
    }
  }

  Future<int> insert(Map<String, dynamic> row) async {
    var database = await db();
    return await database.insert("promotions", row);
  }

  Future<List<Promotion>> queryAllRows() async {
    var database = await db();
    var res = await database.query("promotions");

    print(res.toString());

    List<Promotion> list =
        res.isNotEmpty ? res.map((e) => Promotion.fromJson(e)).toList() : [];
    return list;
  }

  Future<int> queryRowCount() async {
    var database = await db();
    final results = await database.rawQuery('SELECT COUNT(*) FROM promotions');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  Future<int> update(Map<String, dynamic> row) async {
    var database = await db();
    int id = row["id"];
    return await database.update(
      "promotions",
      row,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> delete(int id) async {
    var database = await db();
    return await database.delete(
      "promotions",
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
