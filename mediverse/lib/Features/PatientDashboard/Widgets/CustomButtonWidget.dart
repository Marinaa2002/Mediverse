import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';

class CustomButtonWidget extends StatelessWidget {
  CustomButtonWidget({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 50,
          width: 130,
          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: kprimaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.upload_sharp,
                size: 20,
                color: Colors.white,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                'Upload',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Readex Pro',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
