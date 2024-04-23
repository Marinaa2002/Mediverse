import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/presentation/Manager/cubit/appointment_details_cubit.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/presentation/Views/AppointmentDetailsScreen.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/SearchBar.dart';

import '../Widgets/CustomCardRatings.dart';
import '../Widgets/SearchBoxAppointmentWidget.dart';

class AppointmentTab extends StatelessWidget {
  AppointmentTab({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppointmentDetailsCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SearchBarProject(
                searchController: TextEditingController(),
                onSearchTextChanged: (String) {},
              ),
              SizedBox(
                height: 12,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('info_Doctors')
                    .where('Condition', isEqualTo: 'Approved')
                    .snapshots(),
                builder: (context, snapshot) {
                  final doctors = snapshot.data?.docs
                      .map((doc) => Doctor.fromJson(
                          doc.data() as Map<String, dynamic>, doc.id))
                      .toList();
                  if (doctors == null || doctors.isEmpty) {
                    return Center(
                      child: Text("No doctors Available Now"),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: doctors.length,
                          itemBuilder: (context, i) {
                            return CustomCardRatings(
                              doctor: doctors[i],
                            );
                          }),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
