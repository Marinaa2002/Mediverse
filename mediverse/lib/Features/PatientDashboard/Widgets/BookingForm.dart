import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/ActionDetailsWidget.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/Notes.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/RowImageAndText.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SafeArea(
        top: true,
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
                width: 10,
              ),
            ),
            const SliverToBoxAdapter(
              child: ActionDetailsWidget(
                text: "Booking Details",
                imageUrl: "assets/images/booking.jpg",
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
                width: 10,
              ),
            ),
            const SliverToBoxAdapter(
              child: TextWidgetHorz(
                leadingText: "Date Chosen",
                secondryText: "Sat, Oct 04- 7:00pm",
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
                width: 10,
              ),
            ),
            const SliverToBoxAdapter(
              child: TextWidgetHorz(
                leadingText: "Location",
                secondryText: "Tiba Dental Care",
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
                width: 10,
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
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
                    child: const Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: RowImageAndText(
                          text: "Payment Details",
                          imageUrl: "assets/images/Payment.png",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                    width: 10,
                  ),
                  const TextWidgetHorz(
                    leadingText: "Amount",
                    secondryText: "150.00 L.E",
                  ),
                  const Divider(
                    thickness: 2,
                    color: kSecondryBackgroundColor,
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
          ],
        ),
      ),
    );
  }
}
