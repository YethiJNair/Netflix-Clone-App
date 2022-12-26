import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    Key? key,
    required this.icon,
    required this.title,
    this.iconSize = 25,
    this.fontSize = 18,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final double iconSize;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhitecolor,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
          ),
        )
      ],
    );
  }
}
