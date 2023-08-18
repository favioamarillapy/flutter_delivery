import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final Color color;
  final double radius;
  final Function() onPressed;

  const CustomIconButton({
    super.key,
    required this.icon,
    this.iconColor = Colors.black,
    this.iconSize = 20,
    required this.color,
    this.radius = 10,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        width: 40,
        height: 40,
        color: color,
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: iconColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
