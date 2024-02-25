import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Screens/StaffDashboard/Widgets/ListViewPatient.dart';
import 'package:mediverse/Screens/StaffDashboard/Widgets/PatientCard.dart';

class LabStaffScreen extends StatelessWidget {
  const LabStaffScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: // Generated code for this AppBar Widget...
          AppBar(
        backgroundColor: kprimaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Alpha Lab',
          style: Themes.headlineSmall,
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                child: Text('Patients List',
                    style: Themes.bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                    )),
              ),
              const Expanded(
                child: ListViewPatient(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
