import 'package:flutter/material.dart';
import 'package:flutter_delivery/models/models.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryList extends StatelessWidget {
  final categories = <Category>[
    Category(true, FontAwesomeIcons.burger, "Hamburguesas"),
    Category(false, FontAwesomeIcons.pizzaSlice, "Pizza"),
    Category(false, FontAwesomeIcons.drumstickBite, "Pollo"),
    Category(false, FontAwesomeIcons.pepperHot, "Tacos"),
    Category(false, FontAwesomeIcons.martiniGlass, "Bebidas"),
  ];

  CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => CategoryCard(
          categories[index].selected,
          categories[index].icon,
          categories[index].label,
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final bool selected;
  final IconData icon;
  final String label;

  const CategoryCard(this.selected, this.icon, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 90,
          padding: const EdgeInsets.all(5),
          color: selected ? const Color.fromRGBO(254, 78, 2, 1) : Colors.white,
          child: Column(
            children: [
              FaIcon(
                icon,
                color: selected ? Colors.white : Colors.black,
              ),
              Text(
                label,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  color: selected ? Colors.white : Colors.black,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
