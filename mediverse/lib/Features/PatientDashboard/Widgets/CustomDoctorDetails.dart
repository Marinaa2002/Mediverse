import 'package:flutter/material.dart';

import '../../../Constants/Themes.dart';
import 'CustomRatingIcon.dart';

class CustomDoctorDetails extends StatelessWidget {
  const CustomDoctorDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 12),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: Container(
                width: size.width*0.35,
                height: size.width*0.35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                alignment: AlignmentDirectional(0, 0),
                child: Container(
                  width: size.width*0.37,
                  height: size.width*0.37,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80.0),
                    child: Image.asset(
                      'assets/images/360_F_260040900_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg',
                      width: size.width*0.6,
                      height: size.width*0.6,
                      fit: BoxFit.fill,
                      alignment: Alignment(0, 0),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(size.width*0.03, 0, size.width*0.01, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Dr. Janny Wilson',
                        textAlign: TextAlign.start, style: Themes.bodyMedium),
                    Text('Dentist',
                        textAlign: TextAlign.start, style: Themes.labelMedium),
                    Text('Works at Tiba Dental Care',
                        textAlign: TextAlign.start, style: Themes.labelMedium),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, size.width*0.01, 0),
                          child: Text('4.1', style: Themes.labelMedium),
                        ),
                        CustomRatingIconWidget(color: Colors.yellow),
                        CustomRatingIconWidget(color: Colors.yellow),
                        CustomRatingIconWidget(color: Colors.yellow),
                        CustomRatingIconWidget(color: Colors.yellow),
                        CustomRatingIconWidget(color: Colors.grey),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
