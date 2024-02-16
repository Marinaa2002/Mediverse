import 'package:flutter/material.dart';

import '../../../Constants/Themes.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.network(
              'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: Text(
                    'Randy Rudolph',
                    style: Themes.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: const Color(0xFFF1F4F8),
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            child: const Padding(
              padding: EdgeInsets.all(4),
              child: Icon(
                Icons.keyboard_arrow_right_rounded,
                color: Color(0xFF57636C),
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
