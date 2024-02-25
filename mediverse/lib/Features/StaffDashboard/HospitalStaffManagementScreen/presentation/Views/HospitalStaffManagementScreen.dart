import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';

import '../../../Widgets/ActionButton.dart';
import '../../../Widgets/DrAvailableSlots.dart';
import '../../../Widgets/DrAvailableTime.dart';
import '../../../Widgets/DrInformation.dart';

class HospitalStaffManagementScreen extends StatelessWidget {
  const HospitalStaffManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  child: DrInformation()),
            ),
            Align(
              alignment: const AlignmentDirectional(-1, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 0, 12),
                child: Text(
                  'Cost For Booking: 150.00 L.E',
                  style: Themes.bodyMedium,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-1, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                child: Text(
                  'Day',
                  style: Themes.bodyMedium.copyWith(
                    fontFamily: 'Readex Pro',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 18),
              child: DrAvailableSlots(),
            ),
            Align(
              alignment: const AlignmentDirectional(-1, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                child: Text(
                  'Time',
                  style: Themes.bodyMedium.copyWith(
                    fontFamily: 'Readex Pro',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 18),
              child: DrAvailableTime(),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 10, 0),
                    child: ActionButton(
                      action: "Edit",
                      iconData: Icons.edit_off,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                      child: ActionButton(
                        action: "Add",
                        iconData: Icons.add_circle,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
