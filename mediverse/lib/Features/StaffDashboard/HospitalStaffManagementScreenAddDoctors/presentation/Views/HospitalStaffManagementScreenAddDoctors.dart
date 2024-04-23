import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/StaffDashboard/AdminMainScreen/presentation/Manager/FetechAdminInfoCubit.dart/fetech_admin_info_cubit.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreenAddDoctors/data/repos/FetechHMInformationRepoImpl.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreenAddDoctors/presentation/Manager/FetechHospitalMangementCubit/fetech_HM_info_State.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreenAddDoctors/presentation/Manager/FetechHospitalMangementCubit/fetech_HM_info_cubit.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/AppBarNameOfHospital.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/HospitalMangmentAddDoctorsBody.dart';

import '../../../Widgets/PatientCard.dart';
import '../../../Widgets/SearchBar.dart';

class HospitalStaffManagementScreenAddDoctors extends StatefulWidget {
  const HospitalStaffManagementScreenAddDoctors({super.key});

  @override
  State<HospitalStaffManagementScreenAddDoctors> createState() =>
      _HospitalStaffManagementScreenAddDoctorsState();
}

class _HospitalStaffManagementScreenAddDoctorsState
    extends State<HospitalStaffManagementScreenAddDoctors>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FetecHMInfoCubit>(context)
        .getHMInforCubitFunction("V4xmzSMXv8SPM4vW5ra2");
    return BlocBuilder<FetecHMInfoCubit, FetechHMInfoState>(
      builder: (context, state) {
        if (state is FetechHMInfoStateSuccess) {
          return Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              backgroundColor: kprimaryColor,
              automaticallyImplyLeading: false,
              title: Align(
                alignment: const AlignmentDirectional(0, 0),
                child: AppBarNameOfHospital(
                  orgName: state.staffModel.orgName,
                ),
              ),
              actions: const [],
              centerTitle: false,
              elevation: 2,
            ),
            body: HospitalMangmentAddDoctorsBody(
              tabController: _tabController,
              staffModel: state.staffModel,
            ),
          );
        }
        return Container();
      },
    );
  }
}
