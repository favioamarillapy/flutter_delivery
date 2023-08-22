import 'package:flutter/material.dart';
import 'package:flutter_delivery/helpers/DatabaseHelper.dart';
import 'package:flutter_delivery/models/models.dart';

class PromotionProvider with ChangeNotifier {
  final dbHelper = DatabaseHelper();
  List<Promotion> promotions = [];
  bool isLoading = false;

  PromotionProvider() {
    getAllPromotions();
  }

  getAllPromotions() async {
    promotions = await dbHelper.queryAllRows();

    notifyListeners();
  }
}
