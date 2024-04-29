import 'package:flutter/material.dart';
import 'package:mediverse/AllModels/requestModel.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/RowRequestWidget.dart';

import 'ActionButton.dart';

class LabRequestAccountWidget extends StatelessWidget {
  const LabRequestAccountWidget(
      {super.key,
      required this.requestModel,
      required this.onPressedAccept,
      required this.onPressedDecline});
  final RequestModel requestModel;
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
                  requestModelField: requestModel.name,
                  requestField: 'Requested Name',
                ),
                RowOfRequestWidget(
                  requestModelField: requestModel.staff,
                  requestField: 'Requested Account',
                ),
                requestModel.staff == "Doctor"
                    ? Column(
                        children: [
                          RowOfRequestWidget(
                            requestModelField: requestModel.specialty,
                            requestField: 'specialty',
                          ),
                          RowOfRequestWidget(
                            requestModelField: requestModel.specialty,
                            requestField: 'National Id',
                          ),
                        ],
                      )
                    : RowOfRequestWidget(
                        requestModelField: requestModel.orgType,
                        requestField: 'Organization Type'),
                RowOfRequestWidget(
                  requestModelField: requestModel.orgName,
                  requestField: 'Organization Name',
                ),
                RowOfRequestWidget(
                    requestModelField: requestModel.orgType,
                    requestField: 'Organization Type'),
                RowOfRequestWidget(
                    requestModelField: requestModel.location,
                    requestField: 'Address'),
                RowOfRequestWidget(
                    requestModelField: requestModel.phoneNum,
                    requestField: 'Phone Number'),
                RowOfRequestWidget(
                    requestModelField: requestModel.licenseNumber,
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
