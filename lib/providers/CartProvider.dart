import 'package:flutter/material.dart';
import 'package:flutter_delivery/helpers/DatabaseHelper.dart';
import 'package:flutter_delivery/models/models.dart';

class CartProvider with ChangeNotifier {
  final dbHelper = DatabaseHelper();
  List<Cart> cart = [];

  CartProvider() {
    print("CartProvider");
  }

  getCart(int productId) async {
    print("getCart");
    cart = await dbHelper.getCart(productId);
  }

  insertCart(int productId, int quantity) async {
    print("insertCart");
    Cart row = Cart(id: null, productid: productId, quantity: quantity);
    await dbHelper.insertCart(row);
    getCart(productId);

    notifyListeners();
  }

  updateCart(int id, int productId, int quantity) async {
    Cart row = Cart(id: id, productid: productId, quantity: quantity);
    print("updateCart" + row.toJson().toString());
    await dbHelper.updateCart(id, row);
    getCart(productId);

    notifyListeners();
  }
}
