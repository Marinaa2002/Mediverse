import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Features/StaffDashboard/AdminMainScreen/presentation/Views/AdminMainScreen.dart';
import 'package:mediverse/Features/StaffDashboard/AdminMainScreen/presentation/Views/main.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreenAddDoctors/presentation/Manager/FetechHospitalMangementCubit/fetech_HM_info_State.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreenAddDoctors/presentation/Manager/FetechHospitalMangementCubit/fetech_HM_info_cubit.dart';

import '../../../Constants/Themes.dart';

class AppBarNameOfHospital extends StatelessWidget {
  const AppBarNameOfHospital({
    super.key,
    required this.orgName,
  });
  final String orgName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AdminScreenPage()),
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Center(
                  child: Text(
                    orgName,
                    style: Themes.headlineSmall.copyWith(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
