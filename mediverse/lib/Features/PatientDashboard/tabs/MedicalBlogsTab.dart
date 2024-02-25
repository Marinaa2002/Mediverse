import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';

import '../../DoctorDashboard/widgets/BlogCardDoc.dart';
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
              const BlogCardDoc(
                  title: 'How Much Coffee Is Too\nMuch Coffee?',
                  DrName: 'Dr. Salem Ahmed'),
              const BlogCardDoc(
                  title: 'Food Allergies and \nAnaphylactic Shocks',
                  DrName: 'Dr. Waheed Amr'),
              const BlogCardDoc(
                  title: 'What to do with \n a diabetes patient?',
                  DrName: 'Dr. Hoda Raouf'),
            ],
          ),
        ),
      ),
    );
  }
}
