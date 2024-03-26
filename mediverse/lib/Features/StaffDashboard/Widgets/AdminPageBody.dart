import 'package:flutter/material.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/DoctorAccountRequestWidget.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/HospitalAddHideWidget.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/HospitalStaffAccount.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/LabAccountRequest.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/TabBarWidget.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/VerifyAccountWidget.dart';

import '../../../Constants/constant.dart';

class AdminPageBody extends StatelessWidget {
  final tabController;

  const AdminPageBody({super.key, this.tabController});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              children: [
                Align(
                    alignment: const Alignment(0, 0),
                    child: TabBarWidget(
                      tabController: tabController,
                    )),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: const [
                      VerifyAccountWidget(),
                      HospitalViewAndArchrive(),
                    ],
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
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: const AlignmentDirectional(0, 0),
          child: const DoctorAccountRequestWidget(),
        ),
      ),
    );
  }
}

class LabRequestAccountCompeleteWidget extends StatelessWidget {
  const LabRequestAccountCompeleteWidget({
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
          child: const LabRequestAccountWidget(),
        ),
      ),
    );
  }
}

class HospitalViewAndArchrive extends StatelessWidget {
  const HospitalViewAndArchrive({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
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
                ),
                HospitalAddHideWidget(
                  hospitalName: "St peter",
                ),
                HospitalAddHideWidget(
                  hospitalName: "St peter",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
