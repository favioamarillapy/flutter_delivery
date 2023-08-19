import 'package:flutter/material.dart';

class Category {
  bool selected;
  final IconData icon;
  final String label;
  final String code;

  Category(this.selected, this.icon, this.label, this.code);
}
