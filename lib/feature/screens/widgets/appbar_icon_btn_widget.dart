import 'package:flutter/material.dart';

class AppBarIconBtnWidget extends StatelessWidget {
  final IconData icon;
  final double left;
  final double right;
  final Function() onPressed;
  const AppBarIconBtnWidget({
    super.key,
    required this.icon,
    this.left = 0,
    this.right = 0,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: left,
        right: right,
      ),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        // borderRadius: BorderRadius.circular(150),
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: Colors.black,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
