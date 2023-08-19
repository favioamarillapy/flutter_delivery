import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_delivery/models/models.dart';

class ProductProvider with ChangeNotifier {
  final String _baseUrl = "fakestoreapi.com";

  List<ProductResponse> products = [];
  bool isLoading = false;

  ProductProvider() {
    getAllProduct("electronics");
  }

  getAllProduct(String category) async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, '/products/category/$category');
    final response =
        await http.get(url, headers: {'accept': 'application/json'});

    if (response.statusCode == 200) {
      products = List<ProductResponse>.from(
          jsonDecode(response.body).map((x) => ProductResponse.fromJson(x)));
    } else {
      Exception("Product provider error");
    }

    isLoading = false;
    notifyListeners();
  }
}
