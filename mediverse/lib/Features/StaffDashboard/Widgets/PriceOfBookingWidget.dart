import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/AllModels/ClinicsAppointment.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Core/utils/Functions.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/data/models/PricesModel.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/presentation/Views/HospitalStaffManagementScreen.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/ActionButton.dart';

class PriceOfBookingWidget extends StatelessWidget {
  PriceOfBookingWidget({
    super.key,
    required this.textEditingController,
    required this.id,
    required this.orgName,
  });
  int indexOfCost = 0;
  String currentCost = "";

  final TextEditingController textEditingController;
  final String id;
  bool costFound = false;
  final String orgName;
  var doctor;
  CollectionReference prices = FirebaseFirestore.instance.collection('Prices');

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('info_Doctors')
                .doc(id) // Specify the collection name as 'Prices'
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(); // Show a loading indicator while waiting for data
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (snapshot.hasData) {
                final Map<String, dynamic>? data =
                    snapshot.data!.data() as Map<String, dynamic>?;
                ;
                int index = 0;
                doctor = Doctor.fromJson(data!, id);
                for (var clinic in doctor.Clinics) {
                  // Check if the clinic contains the orgName
                  if (clinic['name'] == orgName) {
                    indexOfCost = index;
                    // Check if the Cost matches the specific value
                    if (clinic['cost'] == 0) {
                      costFound = true;
                      break;
                    }
                  }
                  index++;
                }
                if (costFound) {
                  return Text(
                    "Cost : 0",
                    style: Themes.bodyMedium.copyWith(fontSize: 20),
                  );
                }

                return Row(
                  children: [
                    Text(
                      'Cost : ',
                      style: Themes.bodyMedium.copyWith(fontSize: 20),
                    ),
                    Text(
                      '${doctor.Clinics[indexOfCost]['cost']} EGP',
                      style: Themes.bodyMedium.copyWith(fontSize: 20),
                    ),
                  ],
                );
              }
              return const Center();
            }),
        const SizedBox(
          width: 10,
        ),
        ActionButton(
          action: "Edit",
          iconData: Icons.add_circle,
          onPressed: () async {
            final cost = await showTextFieldDialog(
              context,
              textEditingController: textEditingController,
              title: "Cost",
              hintText: "Enter your Price Here",
            );
            if (cost != null) {
              costFound = true;
              Map<String, dynamic> mapToUpdate = doctor.Clinics[indexOfCost];
              mapToUpdate['cost'] =
                  cost; // Replace 'your_field' with the field you want to update
              FirebaseFirestore.instance
                  .collection('info_Doctors')
                  .doc(id)
                  .update({
                'Clinics': doctor.Clinics,
              });
            }
            //momken ashil al providerrrr mn hnaa lo al performance al
          },
        ),
      ],
    );
  }
}
