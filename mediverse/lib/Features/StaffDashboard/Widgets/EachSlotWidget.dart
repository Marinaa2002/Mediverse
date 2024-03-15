import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/data/models/SlotsModel.dart';

class SlotWidget extends StatelessWidget {
  const SlotWidget({
    super.key,
    required this.slot,
    required this.onDismissed,
  });

  final SlotsModel slot;
  final VoidCallback onDismissed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(), // Ensure each item has a unique key
      direction:
          DismissDirection.endToStart, // Allow swiping from right to left
      onDismissed: (_) =>
          onDismissed(), // Call onDismissed callback when dismissed

      // Background when swiping to delete
      background: Container(
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: Icon(Icons.delete, color: Colors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Material(
          color: Colors.transparent,
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            width: 390,
            height: 150,
            decoration: BoxDecoration(
              color: kSecondryBackgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: const AlignmentDirectional(0, 0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 4),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Date(yyyy/mm/dd)',
                            style: Themes.bodyXLarge,
                          ),
                          Text(
                            "${slot.fromDateYear.toString()}/${slot.fromDateMonth.toString()}/${slot.fromDateDay.toString()}",
                            style: Themes.bodyXLarge
                                .copyWith(fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'From',
                            style: Themes.bodyXLarge,
                          ),
                          Text(
                            "${slot.fromDateHour}:00",
                            style: Themes.bodyXLarge
                                .copyWith(fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "To ",
                            style: Themes.bodyXLarge,
                          ),
                          Text(
                            "${slot.toDateHour}:00",
                            style: Themes.bodyXLarge
                                .copyWith(fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
