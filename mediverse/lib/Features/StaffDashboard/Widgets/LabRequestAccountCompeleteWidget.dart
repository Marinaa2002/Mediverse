import 'package:flutter/material.dart';
import 'package:mediverse/AllModels/requestModel.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/LabAccountRequest.dart';

class LabRequestAccountCompeleteWidget extends StatelessWidget {
  const LabRequestAccountCompeleteWidget({
    super.key,
    required this.requestModel,
    required this.onPressedAccept,
    required this.onPressedDecline,
  });
  final RequestModel requestModel;
  final void Function() onPressedAccept;
  final void Function() onPressedDecline;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Material(
        color: Colors.transparent,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          width: 370,
          height: 330,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: const AlignmentDirectional(0, 0),
          child: LabRequestAccountWidget(
            requestModel: requestModel,
            onPressedAccept: onPressedAccept,
            onPressedDecline: onPressedDecline,
          ),
        ),
      ),
    );
  }
}
