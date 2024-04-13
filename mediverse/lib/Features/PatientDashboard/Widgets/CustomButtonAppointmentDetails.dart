import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';

class CustomButtonAppointmentDetails extends StatelessWidget {
  CustomButtonAppointmentDetails(
      {super.key,
      required this.onTap,
      required this.buttonName,
      required this.icon});
  void Function()? onTap;
  String buttonName;
  IconData? icon;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 10, 0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40,
          width:size.width*0.27 ,
          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: kprimaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 15,
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '$buttonName',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Readex Pro',
                    fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
