import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/screens/DoctorDashboard/widgets/HistoryCard.dart';
import 'package:mediverse/screens/DoctorDashboard/widgets/SearchBar.dart';

class PatientHistory extends StatefulWidget {
  const PatientHistory({super.key});

  @override
  State<PatientHistory> createState() {
    return _PatientHistory();
  }
}

class _PatientHistory extends State<PatientHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 24,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Patients\' History',
          style: Themes.headlineMedium.copyWith(
            color: backgroundColor,
          ),
        ),
        actions: const [],
        centerTitle: true,
        elevation: 2,
      ),
      body: const SafeArea(
        top: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SearchBarCustom(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    HistoryCard(),
                    HistoryCard(),
                    HistoryCard(),
                    HistoryCard(),
                    HistoryCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
