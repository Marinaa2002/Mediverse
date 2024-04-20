import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/AllModels/Staff.dart';
import 'package:mediverse/Features/StaffDashboard/AdminMainScreen/data/repos/AddHideRepo.dart';
import 'package:mediverse/Features/StaffDashboard/AdminMainScreen/data/repos/AddHideRepoImpl.dart';
import 'package:mediverse/Features/StaffDashboard/AdminMainScreen/presentation/Manager/AddHideCubit/AddHideCubit.dart';

import 'HospitalAddHideWidget.dart';

class HospitalViewAndArchrive extends StatelessWidget {
  HospitalViewAndArchrive({
    super.key,
  });
  bool option = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddHideCubit(AddHideRepoImpl()),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(5, 15, 5, 0),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Staff').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            final staffs = snapshot.data?.docs
                .map((doc) => StaffModel.fromJson(doc.data()))
                .toList();
            return Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: staffs?.length,
                itemBuilder: (context, i) {
                  return HospitalAddHideWidget(
                    hospitalName: staffs![i].orgName,
                    onChanged: (newvalue) {
                      String staffid = snapshot.data!.docs[i].id;
                      BlocProvider.of<AddHideCubit>(context)
                          .getAddHideFunction(staffs[i]);
                      if (newvalue == true) {
                        FirebaseFirestore.instance
                            .collection('Staff')
                            .doc(staffid)
                            .update({
                          'Condition': 'Show',
                        });
                      } else {
                        FirebaseFirestore.instance
                            .collection('Staff')
                            .doc(staffid)
                            .update({
                          'Condition': 'Hide',
                        });
                      }
                    },
                    staffid: snapshot.data!.docs[i].id,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
