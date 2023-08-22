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

  // promotions
  Future<List<Promotion>> getAllPromotion() async {
    var database = await db();
    var results = await database.query("promotions");

    List<Promotion> list = results.isNotEmpty
        ? results.map((e) => Promotion.fromJson(e)).toList()
        : [];
    return list;
  }

  Future<int> insertPromotion(Map<String, dynamic> row) async {
    var database = await db();
    return await database.insert("promotions", row);
  }

  Future<int> queryRowCountPromotion() async {
    var database = await db();
    final results = await database.rawQuery('SELECT COUNT(*) FROM promotions');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  // favorite
  Future<List<Favorite>> getFavorite(int productid) async {
    var database = await db();
    final results = await database
        .rawQuery('SELECT * FROM favorite where productid = ?', [productid]);

    List<Favorite> list = results.isNotEmpty
        ? results.map((e) => Favorite.fromJson(e)).toList()
        : [];
    return list;
  }

  Future<int> insertFavorite(Favorite row) async {
    var database = await db();
    return await database.insert("favorite", row.toJson());
  }

  Future<int> updateFavorite(Favorite row) async {
    var database = await db();
    return await database.insert("favorite", row.toJson());
  }
}
