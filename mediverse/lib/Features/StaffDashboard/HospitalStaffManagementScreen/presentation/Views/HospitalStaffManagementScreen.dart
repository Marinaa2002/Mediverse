// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/StaffDashboard/AdminMainScreen/presentation/Views/AdminMainScreen.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/HospitalStaffManagementScreenBody.dart';

class HospitalStaffManagementScreen extends StatefulWidget {
  HospitalStaffManagementScreen({super.key});

  @override
  State<HospitalStaffManagementScreen> createState() =>
      _HospitalStaffManagementScreenState();
}

class _HospitalStaffManagementScreenState
    extends State<HospitalStaffManagementScreen> {
  CollectionReference appointments =
      FirebaseFirestore.instance.collection('Appointments');

  ScrollController scrollController = ScrollController();

  TextEditingController textEditingController = TextEditingController();

  Future<void> _handleRefresh() async {
    // Simulate a delay (e.g., fetching data from a network)
    await Future.delayed(const Duration(seconds: 2));

    // Update the data
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String monthName = DateFormat('MMMM').format(now);
    return Scaffold(
      backgroundColor: kSecondryBackgroundColor,
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 24,
          ),
          color: kSecondryBackgroundColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AdminMainScreenWidget()),
            );
          },
        ),
        title: Text('Available Slots',
            style: Themes.headlineMedium.copyWith(color: Colors.white)),
        actions: const [],
        centerTitle: true,
        elevation: 2,
      ),
      body: LiquidPullToRefresh(
        onRefresh: _handleRefresh,
        showChildOpacityTransition: true,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SafeArea(
            top: true,
            child: HospitalStaffManagementScreenBody(
                textEditingController: textEditingController,
                monthName: monthName),
          ),
        ),
      ),
    );
  }
}
