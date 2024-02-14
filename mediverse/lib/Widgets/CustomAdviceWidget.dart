import 'package:flutter/material.dart';

class CustomAdviceWidget extends StatelessWidget {
  CustomAdviceWidget({super.key, required this.advice});
  String advice;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:
      EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
      child: Container(
        width: double.infinity,
        height: 50,
        constraints: BoxConstraints(
          minHeight: 50,
          maxHeight: 100,
        ),
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Text(
                '$advice',
                textAlign: TextAlign.start,
                maxLines: 50,
                style: TextStyle(fontFamily: 'Readex Pro', color: Colors.black,
                  fontSize: 12,)
            ),
          ),
        ),
      ),
    );

  }

}