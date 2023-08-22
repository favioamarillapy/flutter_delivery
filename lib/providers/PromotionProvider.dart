import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_delivery/helpers/DatabaseHelper.dart';
import 'package:flutter_delivery/models/models.dart';

class PromotionProvider with ChangeNotifier {
  List<Promotion> promotions = [];
  bool isLoading = false;

  final dbHelper = DatabaseHelper();

  PromotionProvider() {
    getAllPromotions();
  }

  getAllPromotions() async {
    isLoading = true;
    notifyListeners();

    promotions = await dbHelper.getAllPromotion();
    isLoading = false;
    notifyListeners();
  }
}
