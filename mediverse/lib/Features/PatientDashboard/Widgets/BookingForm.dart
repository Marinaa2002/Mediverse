import 'package:flutter/material.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/presentation/Views/BookingScreen.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/ConfirmButton.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/Notes.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/TextWidgetHorz.dart';

import '../../../Constants/Themes.dart';
import '../../../Constants/constant.dart';

class BookingForm extends StatefulWidget {
  const BookingForm({Key? key}) : super(key: key);

  @override
  State<BookingForm> createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kSecondryBackgroundColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: kSecondryBackgroundColor,
                          width: 2,
                        ),
                      ),
                      alignment: const AlignmentDirectional(0, 0),
                      child: Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/booking.jpg',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0, 0),
                                      child: Text(
                                        'Booking Details',
                                        style: Themes.titleLarge.copyWith(
                                          fontFamily: 'Readex Pro',
                                          color: kprimaryColor,
                                        ),
                                      ),
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
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: TextWidgetHorz(
                      leadingText: "Date Chosen",
                      secondryText: "Sat, Oct 04- 7:00pm",
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                      child: TextWidgetHorz(
                        leadingText: "Location",
                        secondryText: "Tiba Dental Care",
                      )),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: kSecondryBackgroundColor,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: kSecondryBackgroundColor,
                                width: 2,
                              ),
                            ),
                            alignment: const AlignmentDirectional(0, 0),
                            child: Align(
                              alignment: const AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/payment.png',
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              12, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(
                                                    0, 0),
                                            child: Text(
                                              'Payment Details',
                                              style: Themes.titleLarge.copyWith(
                                                fontFamily: 'Readex Pro',
                                                color: kprimaryColor,
                                              ),
                                            ),
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
                        const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: TextWidgetHorz(
                              leadingText: "Amount",
                              secondryText: "150.00 L.E",
                            )),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                          child: Divider(
                            thickness: 2,
                            color: kSecondryBackgroundColor,
                          ),
                        ),
                        Text(
                          'Notes',
                          style: Themes.bodyXLarge,
                        ),
                        const Notes(
                            note:
                                'To ensure smooth scheduling, it is important to note that doctor appointments must be modified, rescheduled, or canceled at least 24 hours before the scheduled time.'),
                        const Notes(
                          note: "Different Text",
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                    child: ConfirmButton(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
