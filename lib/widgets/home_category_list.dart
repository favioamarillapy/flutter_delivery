import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_delivery/theme/app_theme.dart';
import 'package:flutter_delivery/providers/providers.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<CategoryProvider>(context).getAllCategory();

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
          color: selected ? themePrimaryColor : Colors.white,
          child: Column(
            children: [
              FaIcon(
                icon,
                color: selected ? Colors.white : Colors.black54,
              ),
              const SizedBox(height: 3),
              Text(
                label,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  color: selected ? Colors.white : Colors.black54,
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
