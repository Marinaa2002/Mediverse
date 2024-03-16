import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/CustomButtonWidget.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/CustomDateWidget.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/CustomPictureWidget.dart';

class LabResultsScreen extends StatelessWidget {
  LabResultsScreen({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: kSecondryBackgroundColor,
            size: 24,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Lab Results',
          style: TextStyle(
            fontFamily: 'Outfit',
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView(
                children: [
                  CustomDateWidget(date: '16/9/2020'),
                  CustomPictureWidget(pictureLink: 'assets/images/image.jpg'),
                  CustomDateWidget(date: '20/10/2022'),
                  CustomPictureWidget(
                      pictureLink:
                          'assets/images/GNU_Health_lab_report_sample.png'),
                  CustomDateWidget(date: '29/3/2023'),
                  CustomPictureWidget(
                      pictureLink:
                          'assets/images/GNU_Health_lab_report_sample.png'),
                ],
              ),
            ),
            CustomButtonWidget(),
          ],
        ),
      ),
    );
  }
}
