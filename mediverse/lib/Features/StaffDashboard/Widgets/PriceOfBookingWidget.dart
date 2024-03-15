import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/data/models/PricesModel.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/presentation/Views/HospitalStaffManagementScreen.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/ActionButton.dart';

class PriceOfBookingWidget extends StatelessWidget {
  PriceOfBookingWidget({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;
  CollectionReference prices = FirebaseFirestore.instance.collection('Prices');

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Prices') // Specify the collection name as 'Prices'
                .where('D_uid',
                    isEqualTo:
                        'A') // Add a where clause to filter documents where 'D_uid' is equal to 'A' // Limit the query to retrieve only one document
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(); // Show a loading indicator while waiting for data
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (snapshot.hasData) {
                if (snapshot.data!.docs.isEmpty) {
                  return const Text("Cost : 0");
                }
                PriceModel priceModel =
                    PriceModel.fromJson(snapshot.data!.docs[0]);
                return Row(
                  children: [
                    Text(
                      'Cost : ',
                      style: Themes.bodyMedium.copyWith(fontSize: 20),
                    ),
                    Text(
                      '${priceModel.cost} EGP',
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
            //momken ashil al providerrrr mn hnaa lo al performance al
            prices.add(
              {
                'D_uid': "A",
                'Cost': cost,
              },
            );
          },
        ),
      ],
    );
  }
}
