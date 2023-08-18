import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_delivery/models/models.dart';

class CategoryProvider with ChangeNotifier {
  final categories = <Category>[
    Category(true, FontAwesomeIcons.computer, "Electronics", "electronics"),
    Category(false, FontAwesomeIcons.gem, "Jewelery", "jewelery"),
    Category(false, FontAwesomeIcons.shirt, "Men's", "men's clothing"),
    Category(
        false, FontAwesomeIcons.personDress, "Women's", "women's clothing"),
  ];

  getAllCategory() {
    return categories;
  }
}
