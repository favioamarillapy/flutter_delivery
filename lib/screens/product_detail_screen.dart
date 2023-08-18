import 'package:flutter/material.dart';
import 'package:flutter_delivery/theme/app_theme.dart';
import 'package:flutter_delivery/models/models.dart';
import 'package:flutter_delivery/widgets/widgets.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductResponse product =
        ModalRoute.of(context)!.settings.arguments as ProductResponse;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                _PosterImage(product),
                const _PosterButtons(),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _Title(product),
                    _Description(product),
                  ],
                ),
              ),
            ),
            const _PriceSection(),
          ],
        ),
      ),
    );
  }
}

class _PosterImage extends StatelessWidget {
  final ProductResponse product;

  const _PosterImage(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      width: double.infinity,
      height: 300,
      color: Colors.white,
      child: Hero(
        tag: "product-${product.id}",
        child: FadeInImage(
          placeholder: const AssetImage("assets/loading.gif"),
          image: NetworkImage(product.image),
        ),
      ),
    );
  }
}

class _PosterButtons extends StatelessWidget {
  const _PosterButtons();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconButton(
              icon: Icons.arrow_back,
              color: Colors.white70,
              onPressed: () => Navigator.of(context).pop(),
            ),
            CustomIconButton(
              icon: Icons.favorite_border_sharp,
              color: Colors.white70,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final ProductResponse product;

  const _Title(this.product);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              product.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              CustomIconButton(
                icon: Icons.add,
                color: const Color.fromARGB(125, 240, 236, 236),
                onPressed: () {},
              ),
              const SizedBox(width: 12),
              Text(1.toString()),
              const SizedBox(width: 12),
              CustomIconButton(
                icon: Icons.remove,
                color: const Color.fromARGB(125, 240, 236, 236),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _Description extends StatelessWidget {
  final ProductResponse product;

  const _Description(this.product);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        product.description,
        style: const TextStyle(
          color: Colors.grey,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}

class _PriceSection extends StatelessWidget {
  const _PriceSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      color: const Color.fromARGB(125, 240, 236, 236),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Gs. 30.000 ",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: themePrimaryColor,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              color: themePrimaryColor,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Agregar",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
