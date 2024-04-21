import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/presentation/Manager/cubit/appointment_details_cubit.dart';

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
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: const [
                    SingleChildScrollView(
                      child: SearchBoxAppointmentWidget(),
                    ),
                  ],
                ),
                CustomCardRatings(name: 'Dr Ahmed'),
                CustomCardRatings(name: 'Dr Ashraf'),
                CustomCardRatings(name: 'Dr Atef'),
              ],

            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('info_Doctors')
                .where('Condition', isEqualTo: 'Approved')
                .snapshots(),
            builder: (context, snapshot) {
              final doctors = snapshot.data?.docs
                  .map((doc) =>
                      Doctor.fromJson(doc.data() as Map<String, dynamic>))
                  .toList();
              if (doctors == null || doctors.isEmpty) {
                return Center(
                  child: Text("No doctors Aviable Now"),
                );
              }
              return Expanded(
                child: ListView.builder(
                    itemCount: doctors.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AppointmentDetailsScreen(
                                  id: '',
                                ),
                              ));
                        },
                        child: CustomCardRatings(
                          doctor: doctors[i],
                        ),
                      );
                    }),
              );
            },
          ),
        ],
      ),
    );
  }
}
