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
                  requestModel: requestModel,
                  requestField: 'Requested Account',
                ),
                RowOfRequestWidget(
                  requestModel: requestModel,
                  requestField: 'Organization Name',
                ),
                RowOfRequestWidget(
                    requestModel: requestModel,
                    requestField: 'Organization Type'),
                RowOfRequestWidget(
                    requestModel: requestModel, requestField: 'Address'),
                RowOfRequestWidget(
                    requestModel: requestModel, requestField: 'License Number')
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
                    onPressed: onPressedDecline,
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
