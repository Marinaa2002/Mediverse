import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Core/utils/Globals.dart';
import 'package:mediverse/Features/DoctorDashboard/ChatsList/presentation/Views/ChatsList.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorBlogs/presentation/views/MyBlogs.dart';
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
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.bookmark,size:25,color: Colors.white,),
        //     onPressed: () {
        //       Navigator.of(context).push(
        //         MaterialPageRoute(builder: (ctx) => MyBlogs()),
        //       );
        //     },
        //   ),
        // ],
        title: GestureDetector(
          child: AppBarDoctor(),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) =>  DoctorProfile()));
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
              length: 3,
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const Alignment(0, 0),
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        //controller: _tabController,
                        isScrollable: false,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(2, 5, 2, 5),
                            child: Tab(text: 'Patients'),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(2, 5, 2, 5),
                            child: Tab(text: 'Blogs'),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(2, 5, 2, 5),
                            child: Tab(text: 'Chats'),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          PatientsTab(),
                          BlogsTab(),
                          ChatsList(role: 'Doctor')
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
