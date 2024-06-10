// import 'package:flutter/material.dart';
// import 'package:mediverse/Features/DoctorDashboard/PatientHistoryScreen/data/models/BookingsModel.dart';
// import 'package:mediverse/Features/DoctorDashboard/widgets/HistoryCard.dart';
// class PrevPatientsList extends StatelessWidget {
//   final bookings;
//
//   const PrevPatientsList({
//     Key? key,
//     required this.bookings,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height * 0.7,
//       child: ListView.builder(
//         itemCount: bookings.length,
//         itemBuilder: (context, index) {
//           final booking = bookings[index];
//           return
//             HistoryCard(
//             patientName: booking['Name'],
//             // email: booking['Email'],
//             profilePicture: booking['Profile Picture'],
//             // // lastAppointmentDate: booking.lastAppointmentDate ?? 'N/A',
//             // medicalHistory: booking['Medical Records'],
//             // age: booking['Age'],
//           );
//         },
//       ),
//     );
//   }
// }
