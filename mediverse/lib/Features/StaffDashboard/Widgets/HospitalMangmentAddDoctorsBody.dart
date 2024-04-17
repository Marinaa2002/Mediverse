import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mediverse/AllModels/Staff.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Core/utils/Email_service.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/AddDoctorsRequestWidget.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/HospitalMangmentRequestCompleteWidget.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/LabRequestAccountCompeleteWidget.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/PatientCard.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/SearchBar.dart';

class HospitalMangmentAddDoctorsBody extends StatelessWidget {
  const HospitalMangmentAddDoctorsBody({
    Key? key,
    required TabController tabController,
    required this.staffModel,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;
  final StaffModel staffModel;

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
                controller: _tabController,
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
                controller: _tabController,
                children: [
                  Column(
                    children: [
                      SearchBarDoctors(),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('info_Doctors')
                                  .where('Hospital',
                                      isEqualTo: staffModel.orgName)
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot>
                                      doctorRequestsSnapshot) {
                                if (doctorRequestsSnapshot.hasError) {
                                  return Text(
                                      'Error: ${doctorRequestsSnapshot.error}');
                                }

                                if (doctorRequestsSnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: const CircularProgressIndicator());
                                }

                                final doctorsRequested = doctorRequestsSnapshot
                                    .data?.docs
                                    .map((doc) => Doctor.fromJson(
                                        doc.data() as Map<String, dynamic>))
                                    .toList();

                                return Expanded(
                                  child: ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    itemCount: doctorsRequested?.length,
                                    itemBuilder: (context, i) {
                                      return HospitalMangmentRequestCompleteWidget(
                                        doctor: doctorsRequested![i],
                                        onPressedAccept: () {
                                          String requestId =
                                              doctorRequestsSnapshot
                                                  .data!.docs[i].id;

                                          FirebaseFirestore.instance
                                              .collection('info_Doctors')
                                              .doc(requestId)
                                              .update({
                                            'Condition': 'Approved',
                                          });

                                          EmailService().sendEmail(
                                              acceptanceMailDoctor,
                                              'Request Acceptance',
                                              'rinosamyramy@gmail.com');
                                        },
                                        onPressedDecline: () async {
                                          String requestId =
                                              doctorRequestsSnapshot
                                                  .data!.docs[i].id;

                                          FirebaseFirestore.instance
                                              .collection('info_Doctors')
                                              .doc(requestId)
                                              .update({
                                            'Condition': 'Declined',
                                          });
                                          EmailService().sendEmail(
                                              rejectionMail,
                                              'Request Rejection',
                                              'rinosamyramy@gmail.com');
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const MedicalCard(
                        name: "Dr Philo",
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
