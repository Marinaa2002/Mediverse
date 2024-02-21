import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constants.dart';

class CurBookingCard extends StatelessWidget {
  const CurBookingCard({super.key});

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
          height: 160,
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
                          'Patient Name',
                          style: Themes.bodyXLarge,
                        ),
                        Text(
                          'Ahmed Hassan',
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
                          'Sat, Oct 04 - 7:00pm',
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
                          'Tiba Dental Care',
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
