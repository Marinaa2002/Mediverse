import 'package:flutter/material.dart';

import '../../../Features/StaffDashboard/Widgets/ActionButton.dart';

class DoctorAccountRequestWidget extends StatelessWidget {
  const DoctorAccountRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Requested Account',
                    ),
                    Text(
                      'Doctor Account',
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'License Number',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'CNA1125',
                        style: TextStyle(fontSize: 21),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                    child: ActionButton(
                      action: "Accept",
                      iconData: Icons.check_circle,
                    )),
                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: ActionButton(
                      action: "Decline",
                      iconData: Icons.cancel_rounded,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
