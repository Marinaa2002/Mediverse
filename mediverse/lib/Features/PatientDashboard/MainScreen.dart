import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Screens/PatientDashboard/tabs/Appointment%20Tab.dart';
import 'package:mediverse/Screens/PatientDashboard/tabs/MedicalBlogsTab.dart';
import 'package:mediverse/Screens/PatientDashboard/tabs/MedicalRecordTab.dart';
import 'PatientProfileScreen.dart';
import 'Widgets/CustomAppbarMainScreenPatient.dart';

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
        title: CustomAppbarMainScreenPatient(),
        actions: [],
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
                      alignment: Alignment(0, 0),
                      child: TabBar(
                        isScrollable: true,
                        labelColor: kprimaryColor,
                        unselectedLabelColor: Colors.grey,
                        labelStyle:
                        TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                        unselectedLabelStyle: TextStyle(),
                        indicatorColor: kprimaryColor,
                        tabs: [
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
                          MedicalRecordsTab(),
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
