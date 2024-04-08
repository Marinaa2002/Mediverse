import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/StaffDashboard/AdminMainScreen/data/repos/FetechAdminInformationRepoImp.dart';
import 'package:mediverse/Features/StaffDashboard/AdminMainScreen/presentation/Manager/FetechAdminInfoCubit.dart/fetech_admin_info_cubit.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/AdminPageBody.dart';

import '../../../Widgets/AppBarAdminPage.dart';

class AdminMainScreenWidget extends StatefulWidget {
  const AdminMainScreenWidget({super.key});

  @override
  State<AdminMainScreenWidget> createState() => _AdminMainScreenWidgetState();
}

class _AdminMainScreenWidgetState extends State<AdminMainScreenWidget>
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
    BlocProvider.of<FetechAdminInfoCubit>(context)
        .getDoctorInforCubitFunction("jNVIQIAAsAOw6ltr4eBr");
    return Scaffold(
      backgroundColor: kSecondryBackgroundColor,
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        automaticallyImplyLeading: false,
        title: const Align(
          alignment: AlignmentDirectional(0, 0),
          child: AppBarAdminPage(),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 2,
      ),
      body: AdminPageBody(
        tabController: _tabController,
      ),
    );
  }
}
