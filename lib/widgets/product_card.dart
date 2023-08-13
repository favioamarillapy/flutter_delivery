import 'package:flutter/material.dart';
import 'package:flutter_delivery/models/models.dart';

class ProductCard extends StatelessWidget {
  ProductCard({super.key});

  var products = <Product>[
    Product("Whopper", "asdjhagsdhagsd", "25 min.", "Gs. 20.000"),
    Product("Whopper Doble", "asdjhagsdhagsd", "25 min.", "Gs. 30.000"),
    Product(
        "Whopper Doble con Queso", "asdjhagsdhagsd", "25 min.", "Gs. 35.000"),
    Product("Picaña Tradicional", "asdjhagsdhagsd", "25 min.", "Gs. 45.000"),
    Product(
        "Stacker Fanático Triple", "asdjhagsdhagsd", "25 min.", "Gs. 35.000"),
    Product("Cheese Long", "asdjhagsdhagsd", "25 min.", "Gs. 25.000"),
  ];

  @override
  Widget build(BuildContext context) {
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
            onTap: () => Navigator.pushNamed(context, '/product-detail'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.white,
                child: Column(
                  children: [
                    const FadeInImage(
                      placeholder: NetworkImage(
                          "https://bk-latam-prod.s3.amazonaws.com/sites/burgerking.com.py/files/whopper%20tejano.png"),
                      image: NetworkImage(
                          "https://bk-latam-prod.s3.amazonaws.com/sites/burgerking.com.py/files/whopper%20tejano.png"),
                      height: 90,
                    ),
                    SizedBox(
                      height: 40,
                      child: Text(
                        products[index].name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      products[index].price,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color.fromRGBO(254, 78, 2, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
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
