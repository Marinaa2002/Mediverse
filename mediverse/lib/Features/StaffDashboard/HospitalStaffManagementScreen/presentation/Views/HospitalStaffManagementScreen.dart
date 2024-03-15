// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/presentation/Views/DateTimePicker.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/PriceOfBookingWidget.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/SlotsWidget.dart';

import '../../../Widgets/ActionButton.dart';

import '../../../Widgets/DrInformation.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
    await Future.delayed(Duration(seconds: 2));

    // Update the data
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String monthName = DateFormat('MMMM').format(now);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        automaticallyImplyLeading: false,
        leading: const Icon(
          Icons.chevron_left,
          color: kSecondryBackgroundColor,
          size: 24,
        ),
        title: Text('Available Slots', style: Themes.headlineMedium),
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 12),
                    child: DrInformation(),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12, 12, 0, 12),
                    child: PriceOfBookingWidget(
                      textEditingController: textEditingController,
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: Row(
                      children: [
                        Text(
                          'Slots',
                          style: Themes.bodyMedium.copyWith(
                            fontFamily: 'Readex Pro',
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ActionButton(
                          action: "Add",
                          iconData: Icons.add_circle,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DateTimePicker()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 7, 12, 0),
                    child: Text(
                      'For this Month($monthName)',
                      style: Themes.bodyMedium.copyWith(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 18),
                  child: SlotsWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<String?> showTextFieldDialog(BuildContext context,
    {textEditingController, title, hintText}) {
  bool isError = false;
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Form(
          key: _formKey,
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Number';
              }
              if (!isNum(value)) {
                isError = true;
                return 'Please enter Numbers only';
              }
              // Use a regular expression to check if the input contains only numbers

              return null;
            }, // Return null if the input is valid,
            autovalidateMode: AutovalidateMode.onUserInteraction,

            autofocus: true,
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: hintText,
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (!isError) {
                Navigator.of(context).pop(textEditingController.text);
              }
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
}

bool isNum(value) {
  final RegExp numberRegex = RegExp(r'^[0-9]+$');
  if (!numberRegex.hasMatch(value)) {
    return false;
  }
  return true;
}
