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
      size: 24,
    );
    // RatingBar.builder(
    //   initialRating: 0,
    //   minRating: 0,
    //   direction: Axis.horizontal,
    //   allowHalfRating: true,
    //   itemCount: 5,
    //   itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
    //   itemBuilder: (context, _) => Icon(
    //     Icons.star,
    //     color: Colors.amber,
    //   ),
    //   onRatingUpdate: (rating) {
    //     print(rating);
    //   },
    // );
  }
}
