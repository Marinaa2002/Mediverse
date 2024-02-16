import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Screens/StaffDashboard/Widgets/ActionButton.dart';
import 'package:mediverse/Screens/StaffDashboard/Widgets/AddDoctorsRequestWidget.dart';
import 'package:mediverse/Screens/StaffDashboard/Widgets/DoctorAccountRequestWidget.dart';
import 'package:mediverse/Screens/StaffDashboard/Widgets/DoctorsCardRequest.dart';
import 'package:mediverse/Screens/StaffDashboard/Widgets/HospitalAddHideWidget.dart';
import 'package:mediverse/Screens/StaffDashboard/Widgets/HospitalStaffAccount.dart';
import 'package:mediverse/Screens/StaffDashboard/Widgets/LabAccountRequest.dart';
import 'package:mediverse/Screens/StaffDashboard/Widgets/PatientCard.dart';
import 'package:mediverse/Screens/StaffDashboard/Widgets/SearchBar.dart';

class HospitalStaffManagementScreenAddDoctors extends StatefulWidget {
  const HospitalStaffManagementScreenAddDoctors({super.key});

  @override
  State<HospitalStaffManagementScreenAddDoctors> createState() =>
      _HospitalStaffManagementScreenAddDoctorsState();
}

class _HospitalStaffManagementScreenAddDoctorsState
    extends State<HospitalStaffManagementScreenAddDoctors>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        automaticallyImplyLeading: false,
        title: Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Center(
                      child: Text(
                        'St. Peter Hospital',
                        style: Themes.headlineSmall.copyWith(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: const Alignment(0, 0),
                    child: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: kprimaryColor,
                      unselectedLabelColor: const Color(0xff79828a),
                      labelStyle: const TextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                      unselectedLabelStyle: const TextStyle(),
                      indicatorColor: Colors.grey,
                      tabs: const [
                        Tab(
                          text: 'Add Doctors',
                        ),
                        Tab(
                          text: 'My Doctors',
                        ),
                      ],
                      onTap: (i) async {
                        [() async {}, () async {}][i]();
                      },
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        // Generated code for this Row Widget...
                        Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SearchBarDoctors(),
                              ],
                            ),
                            // Generated code for this reviewRow Widget...
                            Expanded(
                              child: ListView.builder(
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return const AddDoctorsRequestWidget();
                                },
                              ),
                            )
                          ],
                        ),
                        ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return const MedicalCard(
                              name: "Dr Philo",
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
