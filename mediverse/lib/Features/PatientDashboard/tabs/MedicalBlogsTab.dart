import 'package:flutter/material.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/BlogCard.dart';

import '../Widgets/SearchBoxAppointmentWidget.dart';

class MedicalBlogsTab extends StatelessWidget {
  MedicalBlogsTab({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
