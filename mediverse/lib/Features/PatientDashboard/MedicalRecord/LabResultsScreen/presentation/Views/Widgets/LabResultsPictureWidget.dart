import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/data/models/labResult_model.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/presentation/Views/Widgets/LabResultLoadingIndicator.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/LabResultsScreen/presentation/Views/Widgets/LabResultPictureInteractive.dart';

class LabResultsPictureWidget extends StatelessWidget {
  LabResultsPictureWidget(
      {super.key, required this.labModelPicture, required this.index, required this.labModelList});

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LabResultModel labModelPicture;
  List<LabResultModel> labModelList;
  int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    LabResultPictureInteractive(imageUrl: labModelPicture.imageUrl),
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
                    imageUrl: labModelPicture.imageUrl,
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.alarm),
                    placeholder: (context, url) =>
                        LabResultLoadingIndicatorWidget(),
                    alignment: Alignment(0, 0),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
