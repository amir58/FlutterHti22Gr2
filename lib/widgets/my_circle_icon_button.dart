import 'package:flutter/material.dart';

class MyCircleIconButton extends StatelessWidget {
  const MyCircleIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.color= Colors.black,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey[300],
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
