import 'package:flutter/material.dart';
import 'package:flutter_delivery/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            color: const Color.fromARGB(125, 240, 236, 236),
            child: const Column(
              children: [_AppBar(), _PromotionCard()],
            )),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                title: const Text('Home'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PromotionCard extends StatelessWidget {
  const _PromotionCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.only(left: 20, top: 20),
          color: const Color.fromRGBO(254, 78, 2, 1),
          width: double.infinity,
          height: 150,
          child: Stack(
            children: [
              const Text(
                "Obten un descuento",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const Positioned(
                top: 20,
                child: Text(
                  "30%",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                    color: Colors.white,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Obtener",
                        style: TextStyle(
                          color: Color.fromRGBO(254, 78, 2, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 160,
                top: -45,
                child: FadeInImage(
                    placeholder: NetworkImage(
                        "https://bk-latam-prod.s3.amazonaws.com/sites/burgerking.com.py/files/whopper%20tejano.png"),
                    image: NetworkImage(
                        "https://bk-latam-prod.s3.amazonaws.com/sites/burgerking.com.py/files/whopper%20tejano.png")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(125, 240, 236, 236),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconButton(
              icon: Icons.details,
              color: Colors.white70,
              onPressed: () {},
            ),
            const Column(
              children: [
                Text(
                  "Ubicacion actual",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.map,
                      color: Colors.orange,
                    ),
                    Text(
                      "Ypacarai, Paraguay",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                )
              ],
            ),
            CustomIconButton(
              icon: Icons.add_alert,
              color: Colors.white70,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
