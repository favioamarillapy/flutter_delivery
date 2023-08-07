import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Function() onPressed;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: color,
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
