import 'package:flutter/material.dart';
import 'package:mediverse/AllModels/booking.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';

class CurBookingCard extends StatelessWidget {
  CurBookingCard({
    super.key,
    required this.booking,
    required this.patient_name,
  });

  Booking booking;
  String patient_name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Material(
        color: Colors.transparent,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          width: 390,
          height: 170,
          decoration: BoxDecoration(
            color: kSecondryBackgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: const AlignmentDirectional(0, 0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 4),
            child: Expanded(
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
                          'Patient Name',
                          style: Themes.bodyXLarge,
                        ),
                        Text(
                          patient_name,
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
                          'Date Chosen',
                          style: Themes.bodyXLarge,
                        ),
                        Text(
                          '${booking.Day.substring(0, 3)}, ${booking.Date} - ${booking.Time}',
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
                          'Location',
                          style: Themes.bodyXLarge,
                        ),
                        Text(
                          booking.Location,
                          style: Themes.bodyXLarge
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.symmetric(
                              horizontal: 20),
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                MediaQuery.sizeOf(context).width * 0.3,
                                40,
                              ),
                              backgroundColor: kprimaryColor,
                            ),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.check_circle,
                              size: 20,
                              color: backgroundColor,
                            ),
                            label: Text(
                              'Done',
                              style: Themes.bodyXLarge.copyWith(
                                color: backgroundColor,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.symmetric(
                              horizontal: 20),
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                MediaQuery.sizeOf(context).width * 0.3,
                                40,
                              ),
                              backgroundColor: kprimaryColor,
                            ),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.cancel_rounded,
                              size: 20,
                              color: backgroundColor,
                            ),
                            label: Text(
                              'Decline',
                              style: Themes.bodyXLarge.copyWith(
                                color: backgroundColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
