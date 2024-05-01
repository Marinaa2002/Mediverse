import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mediverse/AllModels/Staff.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Core/utils/Email_service.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/AddedDoctorsWidget.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/DoctorRequestWidget.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/SearchBar.dart';

class HospitalMangmentAddDoctorsBody extends StatefulWidget {
  const HospitalMangmentAddDoctorsBody({
    Key? key,
    required TabController tabController,
    required this.staffModel,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;
  final StaffModel staffModel;

  @override
  State<HospitalMangmentAddDoctorsBody> createState() =>
      _HospitalMangmentAddDoctorsBodyState();
}

class _HospitalMangmentAddDoctorsBodyState
    extends State<HospitalMangmentAddDoctorsBody> {
  late TextEditingController _searchController;
  late Stream<QuerySnapshot> _doctorStream;
  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _doctorStream = FirebaseFirestore.instance
        .collection('Form_Requests_Info')
        .where('Org Name', isEqualTo: widget.staffModel.orgName)
        .where('Status', isEqualTo: "Verified")
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Expanded(
        child: Column(
          children: [
            Align(
              alignment: const Alignment(0, 0),
              child: TabBar(
                controller: widget._tabController,
                isScrollable: true,
                labelColor: kprimaryColor,
                unselectedLabelColor: const Color(0xff79828a),
                labelStyle: const TextStyle(
                  fontFamily: 'Readex Pro',
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
                unselectedLabelStyle: const TextStyle(),
                indicatorColor: Colors.grey,
                tabs: const [
                  Tab(
                    text: 'Add Doctors',
                  ),
                  Tab(
                    text: 'My Doctors',
                  ),
                ],
                onTap: (i) async {
                  [() async {}, () async {}][i]();
                },
              ),
            ),
            Expanded(
                child: TabBarView(
              controller: widget._tabController,
              children: [
                Column(
                  children: [
                    SearchBarProject(
                      searchController: _searchController,
                      onSearchTextChanged: _onSearchTextChanged,
                    ),
                    Expanded(
                      child: DoctorsRequestWidget(
                          doctorStream: _doctorStream,
                          searchController: _searchController),
                    ),
                  ],
                ),
                AddedDoctorsWidget(widget: widget),
              ],
            ))
          ],
        ),
      ),
    );
  }

  void _onSearchTextChanged(String searchText) {
    setState(() {
      _doctorStream = FirebaseFirestore.instance
          .collection('Form_Requests_Info')
          .where('Org Name', isEqualTo: widget.staffModel.orgName)
          .where('Status', isEqualTo: "Verified")
          .where('Name', isGreaterThanOrEqualTo: searchText)
          .snapshots();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
