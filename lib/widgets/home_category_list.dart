import 'package:flutter/material.dart';
import 'package:flutter_delivery/models/Category.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_delivery/theme/app_theme.dart';
import 'package:flutter_delivery/providers/providers.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final categories = categoryProvider.categories;

    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => CategoryCard(
          categories[index],
          () {
            categoryProvider.cahngeSelected(index);
            productProvider.getAllProduct(categories[index].code);
          },
        ),
      ),
    );
  }
}

class CategoryCard extends StatefulWidget {
  final Category category;
  final Function() onTap;

  CategoryCard(this.category, this.onTap);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 90,
            padding: const EdgeInsets.all(5),
            color: widget.category.selected ? themePrimaryColor : Colors.white,
            child: Column(
              children: [
                FaIcon(
                  widget.category.icon,
                  color:
                      widget.category.selected ? Colors.white : Colors.black54,
                ),
                const SizedBox(height: 3),
                Text(
                  widget.category.label,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    color: widget.category.selected
                        ? Colors.white
                        : Colors.black54,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
