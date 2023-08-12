import 'package:flutter/material.dart';
import 'package:flutter_delivery/widgets/widgets.dart';

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
            icon: Icons.reorder,
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
    );
  }
}
