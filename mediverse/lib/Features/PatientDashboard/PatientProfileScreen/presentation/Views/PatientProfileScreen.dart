import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Core/utils/Globals.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/presentation/Manager/FetechPatientCubit/fetechPatientCubit.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingHistory/data/repos/booking_history_repo_impl.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingHistory/presentation/Managers/cubit/booking_history_cubit.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingHistory/presentation/views/BookingHistory.dart';
import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/presentation/Views/Widgets/ProfileInfoWidget.dart';
import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/presentation/Views/Widgets/ProfileLoadingIndicatorWidget.dart';
import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/presentation/Views/Widgets/ProfileSettingsWidget.dart';
import 'Widgets/ProfilePictureWidget.dart';

class PatientProfileScreen extends StatelessWidget {
  final currentUser = FirebaseAuth.instance.currentUser;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: kSecondryBackgroundColor,
            size: 24,
          ),
          onPressed: () {
            BlocProvider.of<FetechPatientInfoCubit>(context)
                .getPatientInforCubitFunction(globalcurrentUserId);
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'My Profile',
          style: Themes.headlineMedium.copyWith(
            color: backgroundColor,
            fontSize: 22,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("info_Patients")
            .doc(currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            return Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  ProfilePictureWidget(userData: userData),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 4),
                    child: Text(
                      userData['Name'] ?? 'Name',
                      textAlign: TextAlign.center,
                      style: Themes.headlineSmall.copyWith(
                        fontFamily: 'Outfit',
                        color: kprimaryTextColor,
                      ),
                    ),
                  ),
                  Text(
                    userData['Email'] ?? 'Email',
                    style: Themes.titleSmall.copyWith(
                        fontFamily: 'Outfit',
                        color: kprimaryTextColor,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.symmetric(horizontal: 20),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(
                          MediaQuery.sizeOf(context).width * 0.8,
                          40,
                        ),
                        backgroundColor: kprimaryColor,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) =>
                                  BookingHistoryCubit(BookingHistoryRepoImpl())
                                    ..getBookingHistory(globalcurrentUserId),
                              child: BookingHistory(),
                            ),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.calendar_month_outlined,
                        size: 23,
                        color: backgroundColor,
                      ),
                      label: Text(
                        'Bookings History',
                        style: Themes.bodyXLarge.copyWith(
                          color: backgroundColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ProfileSettingsWidget(
                    userData: userData,
                  ),
                ],
              ),
            );
          } else {
            return ProfileLoadingIndicatorWidget();
          }
        },
      ),
    );
  }
}
