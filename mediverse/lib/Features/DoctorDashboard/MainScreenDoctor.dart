import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Core/utils/Globals.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/presentation/Manager/getNameAndPhotoCubit/GetDoctorInfoCubit.dart';
import 'package:mediverse/Features/DoctorDashboard/Tabs/PatientTab.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/AppBarDoctor.dart';

import 'DoctorProfile/presentation/Views/DoctorProfile.dart';
import 'tabs/BlogsTab.dart';

class MainScreenDoctor extends StatelessWidget {
  const MainScreenDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetDoctorInfoCubit>(context)
        .getDoctorInforCubitFunction(globalcurrentUserId);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: kprimaryColor,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          child: AppBarDoctor(),
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
