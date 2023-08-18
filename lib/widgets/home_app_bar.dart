import 'package:flutter/material.dart';
import 'package:flutter_delivery/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            icon: FontAwesomeIcons.bars,
            color: Colors.white70,
            onPressed: () {},
          ),
          const Column(
            children: [
              Text(
                "Location",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.map,
                    color: Colors.blueGrey,
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
            icon: FontAwesomeIcons.bell,
            color: Colors.white70,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
