import 'package:flutter/material.dart';

class CustomMyMessageWidget extends StatelessWidget {
  CustomMyMessageWidget(
      {super.key, required this.message, this.width, this.height});
  String message;
  double? width;
  double? height;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(1, 0),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(12),
            shape: BoxShape.rectangle,
          ),
          alignment: AlignmentDirectional(0, 0),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              '$message',
            ),
          ),
        ),
      ),
    );
  }
}
