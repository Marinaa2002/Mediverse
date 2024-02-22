import 'package:flutter/material.dart';

class CustomNotMyMessageWidget extends StatelessWidget {
  CustomNotMyMessageWidget({super.key, required this.message, this.width, this.height});
  String message;
  double? width;
  double? height;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(-1, 0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 8),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Color.fromRGBO(224, 157, 108, 2),
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: AlignmentDirectional(0, 0),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Text(
              '$message',
              maxLines: 10,
            ),
          ),
        ),
      ),
    );
  }
  }