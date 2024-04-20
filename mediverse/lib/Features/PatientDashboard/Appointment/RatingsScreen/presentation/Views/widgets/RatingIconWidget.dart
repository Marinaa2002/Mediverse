import 'package:flutter/material.dart';

class RatingIconWidget extends StatelessWidget {
  RatingIconWidget({super.key, required this.color});
  Color color;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star_rate_sharp,
      color: color,
      size: 24,
    );
  }
}
