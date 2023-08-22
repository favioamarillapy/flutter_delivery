import 'package:flutter/material.dart';
import 'package:flutter_delivery/helpers/DatabaseHelper.dart';
import 'package:flutter_delivery/models/models.dart';

class FavoriteProvider with ChangeNotifier {
  final dbHelper = DatabaseHelper();
  List<Favorite> favorite = [];

  getFavorite(int productId) async {
    favorite = await dbHelper.getFavorite(productId);
  }

  insertFavorite(int productId) async {
    Favorite favorite = Favorite(id: null, productid: productId, quantity: 0);
    await dbHelper.insertFavorite(favorite);
    notifyListeners();
  }
}