import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/DoctorDashboard/Tabs/PatientTab.dart';

import 'DoctorProfile/presentation/Views/DoctorProfile.dart';
import 'tabs/BlogsTab.dart';

class MainScreenDoctor extends StatelessWidget {
  const MainScreenDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: kprimaryColor,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          child: Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 20, 5),
                  child: Container(
                    width: 65,
                    height: 65,
                    decoration: const BoxDecoration(
                      color: kprimaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Hero(
                        tag: 'profile',
                        child: Container(
                          width: 60,
                          height: 60,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/Human.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Dr. Nader Nabil',
                        style:
                            Themes.titleSmall.copyWith(color: backgroundColor),
                      ),
                      Text(
                        'nader.nabil@gmail.com',
                        style: Themes.bodyXLarge.copyWith(
                          color: backgroundColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => const DoctorProfile()));
          },
        ),
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            DefaultTabController(
              length: 2,
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const Alignment(0, 0),
                      child: TabBar(
                        isScrollable: true,
                        labelColor: kprimaryColor,
                        unselectedLabelColor: kSecondaryTextColor,
                        labelStyle: Themes.bodyMedium,
                        indicatorColor: kprimaryColor,
                        tabs: const [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(2, 5, 2, 5),
                            child: Tab(text: 'Patients'),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(2, 5, 2, 5),
                            child: Tab(text: 'Blogs'),
                          )
                        ],
                      ),
                    ),
                    const Expanded(
                      child: TabBarView(
                        children: [
                          PatientsTab(),
                          BlogsTab(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
