import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/PatientDashboard/tabs/Appointment%20Tab.dart';

import 'Widgets/CustomAppbarMainScreenPatient.dart';
import 'tabs/MedicalBlogsTab.dart';
import 'tabs/MedicalRecordTab/presentation/Views/MedicalRecordTab.dart';

class MainScreenWidget extends StatelessWidget {
  MainScreenWidget({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        automaticallyImplyLeading: false,
        title: const CustomAppbarMainScreenPatient(),
        actions: const [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        top: true,
        child: DefaultTabController(
          length: 3,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: const Alignment(0, 0),
                      child: TabBar(
                     //   isScrollable: true,
                        labelColor: kprimaryColor,
                        unselectedLabelColor: Colors.grey,
                        labelStyle: const TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                        unselectedLabelStyle: const TextStyle(),
                        indicatorColor: kprimaryColor,
                        tabs: const [
                          Tab(
                            text: 'Appointment',
                          ),
                          Tab(
                            text: 'Medical Record',
                          ),
                          Tab(
                            text: 'Medical Blogs',
                          ),
                        ],
                        onTap: (i) async {
                          [() async {}, () async {}, () async {}][i]();
                        },
                      ),
                    ),
                    //Appointment Tab
                    Expanded(
                      child: TabBarView(
                        children: [
                          AppointmentTab(),
                          const MedicalRecordsTab(),
                          MedicalBlogsTab()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
