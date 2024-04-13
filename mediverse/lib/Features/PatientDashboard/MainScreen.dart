import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/PatientDashboard/tabs/Appointment%20Tab.dart';
import 'Widgets/CustomAppbarMainScreenPatient.dart';
import 'tabs/MedicalBlogsTab.dart';
import 'tabs/MedicalRecordTab.dart';

class MainScreenWidget extends StatelessWidget {
  MainScreenWidget({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        key: scaffoldKey,
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: kprimaryColor,
          automaticallyImplyLeading: false,
          title: const CustomAppbarMainScreenPatient(),
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: DefaultTabController(
            length: 3,
            child: Column(
             // mainAxisSize: MainAxisSize.max,
              children: [
                Center(
                  child: TabBar(
                    labelColor: kprimaryColor,
                    unselectedLabelColor: Colors.black,
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
                Expanded(
                  child: TabBarView(
                    children:
                    [
                      AppointmentTab(),
                      MedicalRecordsTab(),
                      MedicalBlogsTab(),
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
