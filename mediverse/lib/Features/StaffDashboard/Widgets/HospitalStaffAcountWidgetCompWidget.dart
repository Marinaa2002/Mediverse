import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/HospitalStaffAccount.dart';

class HospitalStaffAcountWidgetCompWidget extends StatelessWidget {
  const HospitalStaffAcountWidgetCompWidget({
    super.key,
  });

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
          height: 220,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: const AlignmentDirectional(0, 0),
          child: const HospitalStaffAcountWidget(),
        ),
      ),
    );
  }
}
