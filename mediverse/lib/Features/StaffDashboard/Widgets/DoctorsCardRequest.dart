import 'package:flutter/material.dart';

import '../../../Constants/Themes.dart';
import 'ActionButton.dart';

class DoctorCardRequest extends StatelessWidget {
  const DoctorCardRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Bassem Amin',
                      style: Themes.titleLarge.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      width: 45,
                      height: 45,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Image.asset(
                          'assets/images/Human.jpg',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 12),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      style: Themes.labelMedium.copyWith(
                        fontFamily: 'Readex Pro',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ActionButton(
                      action: "Add",
                      iconData: Icons.add_circle,
                      onPressed: () {},
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
