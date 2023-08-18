import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_delivery/models/models.dart';

class ProductProvider with ChangeNotifier {
  final String _baseUrl = "fakestoreapi.com";
  List<ProductResponse> products = [];

  ProductProvider() {
    getAllProduct();
  }

  getAllProduct() async {
    final url = Uri.https(_baseUrl, '/products/category/electronics');
    final response =
        await http.get(url, headers: {'accept': 'application/json'});

    if (response.statusCode == 200) {
      products = List<ProductResponse>.from(
          jsonDecode(response.body).map((x) => ProductResponse.fromJson(x)));
    } else {
      Exception("Product provider error");
    }

    notifyListeners();
  }
}
