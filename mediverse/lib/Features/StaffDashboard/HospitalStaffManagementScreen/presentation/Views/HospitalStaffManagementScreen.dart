// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/data/models/SlotsModel.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/data/repos/AvailableSlotsRepoImp.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/presentation/Manager/SlotsCubit/SlotsCubit.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/presentation/Views/DateTimePicker.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/SlotsWidget.dart';

import '../../../Widgets/ActionButton.dart';

import '../../../Widgets/DrInformation.dart';

class HospitalStaffManagementScreen extends StatelessWidget {
  HospitalStaffManagementScreen({super.key});

  CollectionReference appointments =
      FirebaseFirestore.instance.collection('Appointments');
  ScrollController scrollController = ScrollController();
  CollectionReference prices = FirebaseFirestore.instance.collection('Prices');
  TextEditingController textEditingController = TextEditingController();

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
      body: SafeArea(
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
                padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 0, 12),
                child: Row(
                  children: [
                    Text(
                      'Cost : ',
                      style: Themes.bodyMedium.copyWith(fontSize: 20),
                    ),
                    Text(
                      '150 EGP',
                      style: Themes.bodyMedium.copyWith(fontSize: 20),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ActionButton(
                      action: "Edit",
                      iconData: Icons.add_circle,
                      onPressed: () async {
                        final cost = await showTextFieldDialog(
                          context,
                          textEditingController: textEditingController,
                          title: "Cost",
                          hintText: "Enter your Price Here",
                        );
                        prices.add(
                          {
                            'D_uid': "A",
                            'Cost': cost,
                          },
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
                padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
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
            Text(
              'For this Month($monthName)',
              style: Themes.bodyMedium,
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 18),
              child: BlocProvider(
                create: ((context) => SlotsReterivalCubit(
                      AvailableSlotsRepoImp(),
                    )),
                child: SlotsWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<String?> showTextFieldDialog(BuildContext context,
    {textEditingController, title, hintText}) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: hintText,
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
              Navigator.of(context).pop(textEditingController.text);
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
}
