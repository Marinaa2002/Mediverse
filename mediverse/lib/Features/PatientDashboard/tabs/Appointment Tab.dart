import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Core/utils/Globals.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/Loading.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/presentation/Manager/cubit/appointment_details_cubit.dart';
import 'package:mediverse/Features/PatientDashboard/Recommendation%20System/data/repo/recommendation_repo_impl.dart';
import 'package:mediverse/Features/PatientDashboard/Recommendation%20System/presentation/Manager/cubit/recommendation_cubit.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/RecommendationText.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/SearchBar.dart';

import '../Widgets/CustomCardRatings.dart';

class AppointmentTab extends StatefulWidget {
  AppointmentTab({super.key});

  @override
  State<AppointmentTab> createState() => _AppointmentTabState();
}

class _AppointmentTabState extends State<AppointmentTab> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late TextEditingController _searchController;
  String _searchQuery = '';

  late Stream<QuerySnapshot> _doctorStream;
  final Map<String, bool> _specialties = {
    'Cardiologist': false,
    'Endocrinologist': false,
    'Neurologist': false,
    'Dentist': false,
    'Dermatologist': false,
    'Internist': false,
    'Nutritionist': false,
    'Psychiatrist': false,
  };

  @override
  void initState() {
    _searchController = TextEditingController();
    _doctorStream = FirebaseFirestore.instance
        .collection('info_Doctors')
        .where('Condition', isEqualTo: 'Approved')
        .where('Slots', isGreaterThan: []).snapshots();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchPressed() {
    setState(() {
      _searchQuery = _searchController.text;
    });
  }

  void _onSpecialtySelected(String specialty) {
    setState(() {
      _specialties.updateAll((key, value) => false);
      _specialties[specialty] = true;
      _searchQuery = specialty;
      _searchController.clear();
    });
  }

  List<Doctor> _filterDoctors(List<Doctor> doctors, String query) {
    if (query.isEmpty) return doctors;
    final lowerCaseQuery = query.toLowerCase();
    return doctors.where((doctor) {
      final name = doctor.name?.toLowerCase();
      final specialty = doctor.speciality?.toLowerCase();
      return (name != null && name.contains(lowerCaseQuery)) ||
          (specialty != null && specialty.contains(lowerCaseQuery));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppointmentDetailsCubit(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              SearchBarProject(
                searchController: _searchController,
                onSearchTextChanged: (_) => _onSearchPressed(),
              ),
              SizedBox(height: 10),
              Container(
                height: 20,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: _specialties.keys.map((specialty) {
                    return Row(
                      children: [
                        Checkbox(
                          value: _specialties[specialty],
                          onChanged: (bool? value) {
                            if (value == true) {
                              _onSpecialtySelected(specialty);
                            } else {
                              setState(() {
                                _specialties[specialty] = false;
                                _searchQuery = '';
                              });
                            }
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            _onSpecialtySelected(specialty);
                          },
                          child: Text(specialty),
                        ),
                        SizedBox(width: 10),
                      ],
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              BlocProvider(
                create: (context) => RecommendationCubit(RecommendationRepoImpl())..createRecommendation(globalcurrentUserId),
                child: RecommendationText(),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: _doctorStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: Loading());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error loading doctors'));
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(child: Text('No doctors available'));
                  }

                  var doctors = snapshot.data!.docs.map((doc) {
                    return Doctor.fromJson(
                        doc.data() as Map<String, dynamic>, doc.id);
                  }).toList();

                  doctors = _filterDoctors(doctors, _searchQuery);

                  return Expanded(
                    child: doctors.isEmpty
                        ? Center(
                            child: Text(
                              "No Results Found",
                              style: Themes.bodyLarge.copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey),
                            ),
                          )
                        : ListView.builder(
                            itemCount: doctors.length,
                            itemBuilder: (context, index) {
                              return CustomCardRatings(doctor: doctors[index]);
                            },
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
