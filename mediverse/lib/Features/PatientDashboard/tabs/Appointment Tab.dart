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

class AppointmentTab extends StatefulWidget {
  AppointmentTab({super.key});

  @override
  State<AppointmentTab> createState() => _AppointmentTabState();
}

class _AppointmentTabState extends State<AppointmentTab> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late TextEditingController _searchController = TextEditingController();

  late Stream<QuerySnapshot> _doctorStream;
  late Stream<QuerySnapshot> _originalDoctorStream;
  @override
  void initState() {
    _searchController = TextEditingController();
    _originalDoctorStream = FirebaseFirestore.instance
        .collection('info_Doctors')
        .where('Condition', isEqualTo: 'Approved')
        .snapshots();
    _doctorStream = _originalDoctorStream;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppointmentDetailsCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SearchBarProject(
                searchController: _searchController,
                onSearchTextChanged: _onSearchTextChanged,
              ),
              SizedBox(
                height: 12,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: _doctorStream,
                builder: (context, snapshot) {
                  final doctors = snapshot.data?.docs
                      .map((doc) => Doctor.fromJson(
                          doc.data() as Map<String, dynamic>, doc.id))
                      .toList();

                  if (doctors == null || doctors.isEmpty) {
                    return Center(
                      child: Text("No doctors Available"),
                    );
                  } else {
                    // if (_searchController.text.isNotEmpty) {
                    //   doctors = doctors?.where((doctor) {
                    //     final name = doctor.name?.toLowerCase();
                    //     final searchValue =
                    //         _searchController.text.toLowerCase();
                    //     return name!.contains(searchValue);
                    //   }).toList();
                    // }
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

  void _onSearchTextChanged(String searchText) {
    setState(() {
      if (searchText.isNotEmpty) {
        _doctorStream = FirebaseFirestore.instance
            .collection('info_Doctors')
            .where('Name', isGreaterThanOrEqualTo: searchText.toLowerCase())
            .where('Name',
                isLessThanOrEqualTo: searchText.toLowerCase() + '\uf8ff')
            .where('Condition', isEqualTo: 'Approved')
            .snapshots();
      } else {
        // If search text is empty, keep the current search results
        _doctorStream = _originalDoctorStream;
      }
    });
  }
}
