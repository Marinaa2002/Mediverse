import 'package:flutter/material.dart';

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
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 10, 0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40,
          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.indigo,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 15,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
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
