import 'package:flutter/material.dart';

import '../../../Widgets/CustomButtonWidget.dart';
import '../../../Widgets/CustomDateWidget.dart';
import '../../../Widgets/CustomPictureWidget.dart';

class MedicalPrescriptionsScreen extends StatelessWidget {
  MedicalPrescriptionsScreen({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        automaticallyImplyLeading: false,
        leading: Icon(
          Icons.chevron_left,
          color: Colors.white,
          size: 24,
        ),
        title: Text(
          'Medical Prescription',
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
                  CustomPictureWidget(pictureLink: 'assets/images/Sample-prescription-used-as-input-to-the-GUI-developed-in-the-present-work.png'),
                  CustomDateWidget(date: '20/10/2022'),
                  CustomPictureWidget(pictureLink: 'assets/images/20180526152346127.jpg'),
                  CustomDateWidget(date: '29/3/2023'),
                  CustomPictureWidget(pictureLink: 'assets/images/medical-prescription-ocr.webp'),
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
