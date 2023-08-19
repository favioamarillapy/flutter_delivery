import 'package:flutter/material.dart';
import 'package:flutter_delivery/theme/app_theme.dart';

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
          color: themePrimaryColor,
          width: double.infinity,
          height: 150,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Discounts on electronics",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const Text(
                    "30%",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 0),
                      color: Colors.white,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Claim voucher",
                          style: TextStyle(
                            color: themePrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Positioned(
                child: Image(
                  image: NetworkImage(
                      "https://static.vecteezy.com/system/resources/previews/010/869/748/original/laptop-computer-or-notebook-with-blank-screen-png.png"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
