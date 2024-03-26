import 'package:flutter/material.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/AdminPageBody.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/HospitalStaffAcountWidgetCompWidget.dart';

class VerifyAccountWidget extends StatelessWidget {
  const VerifyAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabRequestAccountCompeleteWidget(),
          DoctorAccountRequestWidgetCompWidget(),
          HospitalStaffAcountWidgetCompWidget(),
          HospitalStaffAcountWidgetCompWidget(),
        ],
      ),
    );
  }
}
