import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Stack(
              children: [
                Image(
                  image: NetworkImage(
                      "https://s7d1.scene7.com/is/image/mcdonalds/t-mcdonalds-Bacon-Egg-Cheese-Biscuit-Regular-Size-Biscuit-1:1-4-product-tile-desktop"),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                _ActionsButton(),
              ],
            ),
            _Title(),
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  _Title();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          children: [
            Text("Bacon,Egg & Cheese Biscuit"),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.remove),
            )
          ],
        )
      ],
    );
  }
}

class _ActionsButton extends StatelessWidget {
  const _ActionsButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            color: Colors.red,
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          IconButton(
            color: Colors.red,
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border_sharp,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
