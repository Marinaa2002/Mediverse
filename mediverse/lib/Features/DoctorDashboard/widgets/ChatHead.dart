import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/PatientDashboard/PatientProfileScreen/data/models/PatientProfileModel.dart';
import '../../../Constants/Themes.dart';

class ChatHead extends StatelessWidget {
  const ChatHead({
    Key? key,
    required this.patient_id,
    required this.doctor_id,
    required this.chatterRole,
  }) : super(key: key);

  final String doctor_id;
  final String patient_id;

  final String chatterRole;

  @override
  Widget build(BuildContext context) {
    return chatterRole == "DoctorProfile"
        ? StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection(chatterRole)
                .doc(doctor_id)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: SpinKitSpinningCircle(
                  color: kprimaryColor,
                  size: 50,
                )); // Show a loading indicator while waiting for data
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } //
              if (!snapshot.hasData) {
                return Center(
                  child: Text('No Doctor available'),
                ); // Show a loading indicator while waiting for data
              }
              PatientProfileModel profileModel = PatientProfileModel.fromJson(
                  snapshot.data!.data()); //5aif a3ml edit bs hwa doctor
              return Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, '/DoctorChat', arguments: {
                          'patient_id': patient_id,
                          'doctor_id': doctor_id
                        });
                      },
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: CachedNetworkImage(
                          imageUrl: profileModel.profilePicture,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        profileModel.name,
                        style: Themes.bodyLarge,
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: const Color(0xFF57636C),
                        size: 24,
                      ),
                    ),
                  ),
                  Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.grey[300]), // Add Divider
                ],
              );
            })
        : StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection(chatterRole)
                .doc(patient_id)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: SpinKitSpinningCircle(
                  color: kprimaryColor,
                  size: 50,
                )); // Show a loading indicator while waiting for data
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } //
              if (!snapshot.hasData) {
                return Center(
                  child: Text('No Doctor available'),
                ); // Show a loading indicator while waiting for data
              }
              PatientProfileModel profileModel = PatientProfileModel.fromJson(
                  snapshot.data!.data()); //5aif a3ml edit bs hwa doctor
              return Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, '/DoctorChat', arguments: {
                          'patient_id': patient_id,
                          'doctor_id': doctor_id
                        });
                      },
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: CachedNetworkImage(
                          imageUrl: profileModel.profilePicture,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        profileModel.name,
                        style: Themes.bodyLarge,
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: const Color(0xFF57636C),
                        size: 24,
                      ),
                    ),
                  ),
                  Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.grey[300]), // Add Divider
                ],
              );
            });
  }
}
