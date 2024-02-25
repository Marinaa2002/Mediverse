import 'package:flutter/material.dart';
import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/presentation/Views/PatientProfileScreen.dart';

import '../../../Constants/constant.dart';

class CustomAppbarMainScreenPatient extends StatelessWidget {
  const CustomAppbarMainScreenPatient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PatientProfileScreen(),
                  ));
            },
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 10),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: kprimaryColor,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: Container(
                    width: 50,
                    height: 50,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/360_F_260040900_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'AlexHubert Wong',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'hubert.wong@gmail.com',
                  style: TextStyle(
                    fontFamily: 'Readex Pro',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
