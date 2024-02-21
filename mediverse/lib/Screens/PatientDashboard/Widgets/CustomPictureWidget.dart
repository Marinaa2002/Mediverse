import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomPictureWidget extends StatelessWidget {
  CustomPictureWidget({super.key, required this.pictureLink});

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String pictureLink;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
            12, 0, 12, 12),
        child: Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Color(0x33000000),
                offset: Offset(0, 2),
              )
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                '$pictureLink',
                width: 300,
                height: 200,
                fit: BoxFit.fill,
                alignment: Alignment(0, 0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}