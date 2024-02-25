import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';

import '../../../Features/PatientDashboard/Widgets/SendAdviceBox.dart';
import '../Widgets/CustomAdviceWidget.dart';
import '../Widgets/CustomDateWidget.dart';

class DrNotesScreen extends StatelessWidget {
  DrNotesScreen({super.key});

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
        title: const Text('My Medical Notes',
            style: TextStyle(
              fontFamily: 'Outfit',
              color: Colors.white,
              fontSize: 20,
            )),
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
                  CustomDateWidget(date: '8/8/2023'),
                  CustomAdviceWidget(
                      advice: ' Don\'t eat fatty foods for you cholestrol'),
                  CustomDateWidget(date: '15/9/2023'),
                  CustomAdviceWidget(
                      advice: ' Drink about 2 litres of water per day'),
                  CustomDateWidget(date: '20/9/2023'),
                  CustomAdviceWidget(
                      advice:
                          'Make sure to eat well before taking your medication'),
                ],
              ),
            ),
            const SendAdviceBox(),
          ],
        ),
      ),
    );
  }
}
