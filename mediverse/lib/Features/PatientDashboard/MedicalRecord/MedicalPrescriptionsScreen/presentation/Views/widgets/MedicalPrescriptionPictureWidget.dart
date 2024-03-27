import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/MedicalPrescriptionsScreen/data/models/medical_prescription_model.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/MedicalPrescriptionsScreen/presentation/Views/widgets/MedicalPrescriptionLoadingIndicator.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/MedicalPrescriptionsScreen/presentation/Views/widgets/MedicalPrescriptionPictureInteractive.dart';

class MedicalPrescriptionPictureWidget extends StatelessWidget {
  MedicalPrescriptionPictureWidget(
      {super.key, required this.medicalPrescriptionPicture, required this.index, required this.medicalPrescriptionModelList});

  final scaffoldKey = GlobalKey<ScaffoldState>();
  MedicalPrescriptionModel medicalPrescriptionPicture;
  List<MedicalPrescriptionModel> medicalPrescriptionModelList;
  int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    MedicalPrescriptionPictureInteractive(imageUrl: medicalPrescriptionPicture.imageUrl),
              ));
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: Align(
            alignment: Alignment(0, 0),
            child: Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x33000000),
                    offset: Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Align(
                alignment: Alignment(0, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    height: 200,
                    width: 300,
                    fit: BoxFit.cover,
                    imageUrl: medicalPrescriptionPicture.imageUrl,
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.alarm),
                    placeholder: (context, url) =>
                        MedicalPrescriptionLoadingIndicatorWidget(),
                    alignment: Alignment(0, 0),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
