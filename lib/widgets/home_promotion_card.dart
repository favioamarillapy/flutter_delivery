import 'package:flutter/material.dart';

class PromotioCard extends StatelessWidget {
  const PromotioCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.only(left: 20, top: 20),
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
                      "https://bk-latam-prod.s3.amazonaws.com/sites/burgerking.com.py/files/whopper%20tejano.png"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
