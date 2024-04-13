import 'package:flutter/material.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/DoctorAccountRequestWidget.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/HospitalAddAndArchrive.dart';

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
