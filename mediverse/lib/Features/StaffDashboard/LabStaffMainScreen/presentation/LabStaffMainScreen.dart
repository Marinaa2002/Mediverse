import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreenAddDoctors/presentation/Manager/FetechHospitalMangementCubit/fetech_HM_info_cubit.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/ListViewPatient.dart';

class LabStaffScreen extends StatelessWidget {
  LabStaffScreen({super.key});
  String id = '';
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    if (args != null) {
      id = args['id'];
    }
    BlocProvider.of<FetecHMInfoCubit>(context).getHMInforCubitFunction(id);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: // Generated code for this AppBar Widget...
          AppBar(
        backgroundColor: kprimaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Alpha Lab',
          style: Themes.headlineSmall,
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                child: Text('Patients List',
                    style: Themes.bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                    )),
              ),
              const Expanded(
                child: ListViewPatient(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
