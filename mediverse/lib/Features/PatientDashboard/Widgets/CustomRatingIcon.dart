import 'package:flutter/material.dart';

class CustomRatingIconWidget extends StatelessWidget {
  CustomRatingIconWidget({super.key, required this.color});
  Color color;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star_rate_sharp,
      color: color,
      size: 20,
    );
  }
}
