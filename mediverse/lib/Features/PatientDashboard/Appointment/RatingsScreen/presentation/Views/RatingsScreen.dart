import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/ReviewPageBody.dart';



class RatingsScreen extends StatelessWidget {
  RatingsScreen({super.key});

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
          'Review Page',
          style: TextStyle(
            fontFamily: 'Outfit',
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: const SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: ReviewPageBody(),
        ),
      ),
    );
  }
}
