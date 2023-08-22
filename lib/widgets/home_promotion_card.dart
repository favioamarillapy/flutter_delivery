import 'package:flutter/material.dart';
import 'package:flutter_delivery/models/models.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_delivery/providers/PromotionProvider.dart';
import 'package:flutter_delivery/theme/app_theme.dart';

class PromotionCard extends StatelessWidget {
  const PromotionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = Provider.of<PromotionProvider>(context).isLoading;
    final promotions = Provider.of<PromotionProvider>(context).promotions;

    return !isLoading
        ? CarouselSlider.builder(
            options: CarouselOptions(
              height: 150,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(seconds: 2),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
            itemCount: promotions.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    _CustomCard(promotions[itemIndex]),
          )
        : Container(
            width: double.infinity,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 185, vertical: 55),
            child: const CircularProgressIndicator(),
          );
  }
}

class _CustomCard extends StatelessWidget {
  final Promotion promotion;

  const _CustomCard(this.promotion);

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
                  Text(
                    promotion.title.toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "${promotion.discount.toString()}%",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 0,
                      ),
                      height: 40,
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
              /*const Positioned(
                child: Image(
                  image: NetworkImage(
                      "https://static.vecteezy.com/system/resources/previews/010/869/748/original/laptop-computer-or-notebook-with-blank-screen-png.png"),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
