import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Screens/StaffDashboard/Widgets/ActionButton.dart';
import 'package:mediverse/Screens/StaffDashboard/Widgets/DoctorAccountRequestWidget.dart';
import 'package:mediverse/Screens/StaffDashboard/Widgets/HospitalAddHideWidget.dart';
import 'package:mediverse/Screens/StaffDashboard/Widgets/HospitalStaffAccount.dart';
import 'package:mediverse/Screens/StaffDashboard/Widgets/LabAccountRequest.dart';

class AdminMainScreenWidget extends StatefulWidget {
  const AdminMainScreenWidget({super.key});

  @override
  State<AdminMainScreenWidget> createState() => _AdminMainScreenWidgetState();
}

class _AdminMainScreenWidgetState extends State<AdminMainScreenWidget>
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
      backgroundColor: kSecondryBackgroundColor,
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        automaticallyImplyLeading: false,
        title: Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 10),
                child: Container(
                  width: 53,
                  height: 53,
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      width: 50,
                      height: 50,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/Human.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'AlexHubert Wong',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      'hubert.wong@gmail.com',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
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
                          text: 'Verify Account',
                        ),
                        Tab(
                          text: 'Archive Account',
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
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
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
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Material(
                                  color: Colors.transparent,
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
                              ),
                              Padding(
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
                              ),
                              Padding(
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
                              ),
                            ],
                          ),
                        ),
                        const Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 15, 5, 0),
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
