import 'package:flutter/material.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/HospitalAddHideWidget.dart';

class HospitalViewAndArchrive extends StatelessWidget {
  const HospitalViewAndArchrive({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 15, 5, 0),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                HospitalAddHideWidget(
                  hospitalName: "ST Mark",
                  onChanged: (bool) {},
                ),
                HospitalAddHideWidget(
                  hospitalName: "St peter",
                  onChanged: (bool) {},
                ),
                HospitalAddHideWidget(
                  hospitalName: "St peter",
                  onChanged: (bool) {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
