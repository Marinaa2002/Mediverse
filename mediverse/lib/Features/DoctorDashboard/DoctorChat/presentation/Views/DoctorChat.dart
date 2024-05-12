// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Core/utils/Globals.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/data/models/MessageModel.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/data/repos/getDoctorInfoRepoImp.dart';
import 'package:mediverse/Features/DoctorDashboard/DoctorChat/presentation/Manager/getNameAndPhotoCubit/GetDoctorInfoCubit.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/AppBarRowChat.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/ChatCoumn.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/NameIconChat.dart';
import 'package:mediverse/Features/DoctorDashboard/widgets/PopUpMenu.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/data/repos/GetPatientInfoRepo.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/data/repos/GetPatientInfoRepoImpl.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/AppointmentDetailsScreen/presentation/Manager/FetechPatientCubit/fetechPatientCubit.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/presentation/Views/HospitalStaffManagementScreen.dart';

class DoctorChat extends StatelessWidget {
  DoctorChat({super.key, this.patientId, this.doctorID, this.NowRole});

  final _controller = ScrollController();

  CollectionReference messages = FirebaseFirestore.instance.collection('Chats');
  TextEditingController controller = TextEditingController();
  String? patientId = '';
  String? doctorID = '';
  String? NowRole = '';
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    if (args != null) {
      patientId = args['patient_id'];
      doctorID = args['doctor_id'];
      NowRole = args['NowRole'];
    }
    //refactor do not need to rebuild all screen
// Replace 'doctor_id' with the ID of the specific doctor
//3ayez a7ot al bloc Provider fo2 shwia 3ashan a3ml call mara wa7da
    if (NowRole == "Patient") {
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => HospitalStaffManagementScreen()),
                // );
                Navigator.pop(context);
              },
              child: AppBarRowIconChat(
                doctor_id: doctorID!,
                patient_id: patientId!,
              ),
            ),
            title: NameIconChat(
              doctor_id: doctorID!,
              patient_id: patientId!,
            ),
            actions: const [
              PopUpWindow(),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ChatCoumn(
              controller2: _controller,
              textEditingcontroller: controller,
              messages: messages,
              doctorId: doctorID!,
              patientId: patientId!,
              nowRole: NowRole!,
            ),
          ),
        ),
      );
    } else {
      return BlocProvider(
        create: (context) => FetechPatientInfoCubit(GetPatientInfoRepoImpl()),
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: kprimaryColor,
            leadingWidth: 100,
            titleSpacing: 0,
            leading: InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => HospitalStaffManagementScreen()),
                // );
                Navigator.pop(context);
              },
              child: AppBarRowIconChat(
                doctor_id: doctorID!,
                patient_id: patientId!,
              ),
            ),
            title: NameIconChat(
              doctor_id: doctorID!,
              patient_id: patientId!,
            ),
            actions: const [
              PopUpWindow(),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ChatCoumn(
              controller2: _controller,
              textEditingcontroller: controller,
              messages: messages,
              doctorId: doctorID!,
              patientId: patientId!,
              nowRole: NowRole!,
            ),
          ),
        ),
      );
    }
  }
}
