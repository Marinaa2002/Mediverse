import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/SearchBar.dart';

import '../Appointment/AppointmentDetailsScreen/presentation/Views/AppointmentDetailsScreen.dart';
import '../Widgets/CustomCardRatings.dart';
import '../Widgets/SearchBoxAppointmentWidget.dart';

class AppointmentTab extends StatelessWidget {
  AppointmentTab({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            child: SearchBarProject(
              searchController: _searchController,
              onSearchTextChanged: (String) {},
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
