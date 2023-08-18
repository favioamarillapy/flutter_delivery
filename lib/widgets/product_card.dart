import 'package:flutter/material.dart';
import 'package:flutter_delivery/providers/ProductProvider.dart';
import 'package:flutter_delivery/theme/app_theme.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context).products;

    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
        ),
        primary: false,
        padding:
            const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 90),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/product-detail',
                arguments: products[index]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.white,
                child: Column(
                  children: [
                    Hero(
                      tag: "product-${products[index].id}",
                      child: FadeInImage(
                        placeholder: const AssetImage("assets/loading.gif"),
                        image: NetworkImage(products[index].image),
                        height: 90,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: Text(
                        products[index].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "\$",
                          style: TextStyle(
                            color: themePrimaryColor,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(width: 2),
                        Text(
                          products[index].price.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: themePrimaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
