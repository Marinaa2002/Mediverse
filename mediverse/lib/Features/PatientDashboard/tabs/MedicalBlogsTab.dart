import 'package:flutter/material.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/BlogCard.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/SearchBar.dart';

import '../Widgets/SearchBoxAppointmentWidget.dart';

class MedicalBlogsTab extends StatelessWidget {
  MedicalBlogsTab({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchBarProject(
                searchController: _searchController,
                onSearchTextChanged: (String) {},
              ),
              BlogCardDoc(
                  title: 'How Much Coffee Is Too\nMuch Coffee?',
                  DrName: 'Dr. Salem Ahmed'),
              BlogCardDoc(
                  title: 'Food Allergies and \nAnaphylactic Shocks',
                  DrName: 'Dr. Waheed Amr'),
              BlogCardDoc(
                  title: 'What to do with \n a diabetes patient?',
                  DrName: 'Dr. Hoda Raouf'),
            ],
          ),
        ),
      ),
    );
  }
}
