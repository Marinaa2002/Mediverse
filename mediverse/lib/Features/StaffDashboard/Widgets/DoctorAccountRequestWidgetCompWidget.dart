import 'package:flutter/material.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/DoctorAccountRequestWidget.dart';

import '../../../Constants/constant.dart';

class DoctorAccountRequestWidgetCompWidget extends StatelessWidget {
  const DoctorAccountRequestWidgetCompWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Material(
        color: const Color.fromARGB(0, 192, 159, 159),
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          width: 370,
          height: 150,
          decoration: BoxDecoration(
            color: kprimaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: const AlignmentDirectional(0, 0),
          child: const DoctorAccountRequestWidget(),
        ),
      ),
    );
  }
}
