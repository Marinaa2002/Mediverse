import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/presentation/Views/HospitalStaffManagementScreen.dart';

class PopUpWindow extends StatelessWidget {
  const PopUpWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      surfaceTintColor: Colors.grey,
      color: Colors.white,
      padding: const EdgeInsets.all(0),
      iconColor: Colors.white,
      onSelected: (value) {},
      itemBuilder: (BuildContext contesxt) {
        return [
          PopupMenuItem(
            value: "Media, links, and docs",
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HospitalStaffManagementScreen()),
                );
              },
              child: const Text(
                "Media, links, and docs",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),

          //N5li mslan al option da l patient ma2fol w al doc mafto7 m3rfsh lsa 5alih for now
          const PopupMenuItem(
            value: "Mute Notification",
            child: Text(
              "Mute Notification",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ];
      },
    );
  }
}
