import 'package:flutter/material.dart';
import 'package:flutter_delivery/widgets/widgets.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                _PosterImage(),
                _PosterButtons(),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _Title(),
                    _Sizes(),
                    SizedBox(height: 20),
                    _Description(),
                  ],
                ),
              ),
            ),
            _PriceSection(),
          ],
        ),
      ),
    );
  }
}

class _PosterImage extends StatelessWidget {
  const _PosterImage();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color.fromARGB(125, 240, 236, 236),
      child: const FadeInImage(
        placeholder: NetworkImage(
            "https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg"),
        image: NetworkImage(
            "https://bk-latam-prod.s3.amazonaws.com/sites/burgerking.com.py/files/whopper.png"),
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
              onPressed: () {},
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
  const _Title();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Text(
              "Whopper",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
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
  const _Description();

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Medallón 100% de carne vacuna a la parrilla, pan con semillas de sésamo, ketchup, pepinos, cebolla y tomate.",
      style: TextStyle(
        color: Colors.grey,
      ),
      textAlign: TextAlign.justify,
    );
  }
}

class _Sizes extends StatelessWidget {
  const _Sizes();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _PropertieSection("Tamaño", "Mediano"),
          VerticalDivider(
            width: 20,
            thickness: 1,
            indent: 20,
            endIndent: 0,
            color: Colors.red,
          ),
          _PropertieSection("Calorias", "150 Kcal"),
          VerticalDivider(
            width: 20,
            thickness: 1,
            indent: 20,
            endIndent: 0,
            color: Colors.red,
          ),
          _PropertieSection("Cocina", "5 - 10 Min."),
        ],
      ),
    );
  }
}

class _PropertieSection extends StatelessWidget {
  final String title;
  final String subTitle;

  const _PropertieSection(this.title, this.subTitle);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        ),
        Text(
          subTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
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
          const Text(
            "Gs. 30.000 ",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(254, 78, 2, 1),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              color: const Color.fromRGBO(254, 78, 2, 1),
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
