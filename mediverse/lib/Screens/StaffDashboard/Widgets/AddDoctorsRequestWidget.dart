import 'package:flutter/material.dart';

import '../../../Constants/constant.dart';
import 'DoctorsCardRequest.dart';

class AddDoctorsRequestWidget extends StatelessWidget {
  const AddDoctorsRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.96,
              decoration: BoxDecoration(
                color: kSecondryBackgroundColor,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x33000000),
                    offset: Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: kprimaryColor,
                ),
              ),
              child: const Padding(
                  padding: EdgeInsets.all(2), child: DoctorCardRequest()),
            ),
          ),
        ],
      ),
    );
  }
}
