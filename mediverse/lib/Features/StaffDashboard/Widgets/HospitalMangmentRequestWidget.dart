import 'package:flutter/material.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/AllModels/requestModel.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/RowRequestWidget.dart';

import 'ActionButton.dart';

class HospitalMangmentRequestWidget extends StatelessWidget {
  const HospitalMangmentRequestWidget(
      {super.key,
      required this.doctorModel,
      required this.onPressedAccept,
      required this.onPressedDecline});
  final Doctor doctorModel;
  final void Function() onPressedAccept;
  final void Function() onPressedDecline;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RowOfRequestWidget(
                  requestModelField: doctorModel.name!,
                  requestField: 'Requested Name',
                ),
                RowOfRequestWidget(
                  requestModelField: doctorModel.hospital,
                  requestField: 'Organization Name',
                ),
                RowOfRequestWidget(
                    requestModelField: doctorModel.licenseNumber,
                    requestField: 'License Number')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                  child: ActionButton(
                    action: "Accept",
                    iconData: Icons.check_circle,
                    onPressed: onPressedAccept,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                  child: ActionButton(
                    action: "Decline",
                    iconData: Icons.cancel_rounded,
                    onPressed: onPressedDecline,
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
