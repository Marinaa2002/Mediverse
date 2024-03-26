// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/data/models/MessageModel.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/data/repos/getDoctorInfoRepoImp.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/presentation/Manager/getNameAndPhotoCubit/GetDoctorInfoCubit.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/AppBarRowChat.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/ChatCoumn.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/NameIconChat.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/PopUpMenu.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/presentation/Views/HospitalStaffManagementScreen.dart';

class DoctorChat extends StatelessWidget {
  DoctorChat({super.key});

  final _controller = ScrollController();

  CollectionReference messages = FirebaseFirestore.instance.collection('Chats');
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //refactor do not need to rebuild all screen
// Replace 'doctor_id' with the ID of the specific doctor
//3ayez a7ot al bloc Provider fo2 shwia 3ashan a3ml call mara wa7da
    return BlocProvider(
      create: (context) => GetDoctorInfoCubit(GetDoctorInfoRepoImp()),
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: kprimaryColor,
          leadingWidth: 100,
          titleSpacing: 0,
          leading: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HospitalStaffManagementScreen()),
              );
            },
            child: AppBarRowIconChat(),
          ),
          title: NameIconChat(),
          actions: const [
            PopUpWindow(),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ChatCoumn(
              controller2: _controller,
              textEditingcontroller: controller,
              messages: messages),
        ),
      ),
    );
  }
}
