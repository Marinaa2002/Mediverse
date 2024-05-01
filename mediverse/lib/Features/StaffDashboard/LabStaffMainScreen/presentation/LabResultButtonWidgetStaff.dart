import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mediverse/Core/utils/Globals.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/presentation/Manager/lab_result_cubit/lab_result_cubit.dart';

import '../../../../../../../Constants/constant.dart';

class LabResultButtonWidgetStaff extends StatelessWidget {
  LabResultButtonWidgetStaff(
      {super.key, required this.scrollController, required this.patientId});

  final now_date = DateFormat('d - M - yyyy ').format(DateTime.now());
  String imageUrl = '';
  final String patientId;
  ScrollController scrollController;
  ImagePicker imagePicker = ImagePicker();
  String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
  XFile? file;
  Reference referenceRoot = FirebaseStorage.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
      child: GestureDetector(
        onTap: () async {
          file = await imagePicker.pickImage(source: ImageSource.gallery);
          if (file == null) return;
          Reference referenceDirImage = referenceRoot.child('images');
          Reference referenceImageToUpload =
              referenceDirImage.child(uniqueFileName);
          try {
            await referenceImageToUpload.putFile(File(file!.path));
            imageUrl = await referenceImageToUpload.getDownloadURL();
            animateToBottom();
            BlocProvider.of<LabResultCubit>(context).sendLabModel(
              now_date: now_date,
              imageUrl: imageUrl,
              id: patientId,
              lab_id: globalcurrentUserId,
            );
            // BlocProvider.of<LabResultCubit>(context).getLabModels();
          } catch (e) {}
        },
        child: Container(
          height: 50,
          width: 130,
          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: kprimaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.upload_sharp,
                size: 20,
                color: Colors.white,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                'Upload',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Readex Pro',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void animateToBottom() {
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(0,
            duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      }
    });
  }
}
