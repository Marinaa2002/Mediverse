import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/Features/StaffDashboard/Widgets/NetworkImage.dart';
import '../../../Constants/Themes.dart';
import '../HospitalStaffManagementScreenAddDoctors/presentation/Views/HospitalStaffManagementScreenAddDoctors.dart';

class MedicalCard extends StatelessWidget {
  const MedicalCard({Key? key, required this.name, this.profile_Picture})
      : super(key: key);

  final String name;
  final String? profile_Picture;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const HospitalStaffManagementScreenAddDoctors(),
                ),
              );
            },
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                "assets/images/Human.jpg",
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              name,
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
            height: 1, thickness: 1, color: Colors.grey[300]), // Add Divider
      ],
    );
  }
}
