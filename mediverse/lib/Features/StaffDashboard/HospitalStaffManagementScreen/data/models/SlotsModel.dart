// // Define a model class for Appointment
// class Appointment {
//   final String dUid;
//   final String pUid;
//   final String hospitalName;
//   final int fromDateDay;
//   final int fromDateHour;
//   final int fromDateMonth;
//   final int fromDateYear;
//   final int toDateDay;
//   final int toDateHour;
//   final int toDateMonth;
//   final int toDateYear;
//   final int bookingPrice;
//   final String currency;
//   final bool isPaid;

//   Appointment({
//     required this.dUid,
//     required this.pUid,
//     required this.hospitalName,
//     required this.fromDateDay,
//     required this.fromDateHour,
//     required this.fromDateMonth,
//     required this.fromDateYear,
//     required this.toDateDay,
//     required this.toDateHour,
//     required this.toDateMonth,
//     required this.toDateYear,
//     required this.bookingPrice,
//     required this.currency,
//     required this.isPaid,
//   });

//   // Factory method to create an Appointment object from a Firestore document snapshot
//   factory Appointment.fromSnapshot(DocumentSnapshot snapshot) {
//     Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
//     return Appointment(
//       dUid: data['D_uid'],
//       pUid: data['P_uid'],
//       hospitalName: data['HospitalName'],
//       fromDateDay: data['FromDateDay'],
//       fromDateHour: data['FromDateHour'],
//       fromDateMonth: data['FromDateMonth'],
//       fromDateYear: data['FromDateYear'],
//       toDateDay: data['TODateDay'],
//       toDateHour: data['TODateHour'],
//       toDateMonth: data['TODateMonth'],
//       toDateYear: data['TODateYear'],
//       bookingPrice: data['bookingPrice'],
//       currency: data['currency'],
//       isPaid: data['isPaid'],
//     );
//   }
// }
