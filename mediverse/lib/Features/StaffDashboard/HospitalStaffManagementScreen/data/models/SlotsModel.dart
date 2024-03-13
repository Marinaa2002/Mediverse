// Define a model class for Appointment
class SlotsModel {
  final String dUid;
  final String pUid;
  final String hospitalName;
  final int fromDateDay;
  final int fromDateHour;
  final int fromDateMonth;
  final int fromDateYear;
  final int toDateDay;
  final int toDateHour;
  final int toDateMonth;
  final int toDateYear;
  final int bookingPrice;
  final String currency;
  final bool isPaid;

  SlotsModel({
    required this.dUid,
    required this.pUid,
    required this.hospitalName,
    required this.fromDateDay,
    required this.fromDateHour,
    required this.fromDateMonth,
    required this.fromDateYear,
    required this.toDateDay,
    required this.toDateHour,
    required this.toDateMonth,
    required this.toDateYear,
    required this.bookingPrice,
    required this.currency,
    required this.isPaid,
  });

  // Factory method to create an Appointment object from a Firestore document snapshot
  factory SlotsModel.fromJson(jsonData) {
    return SlotsModel(
      dUid: jsonData['D_uid'],
      pUid: jsonData['P_uid'],
      hospitalName: jsonData['HospitalName'],
      fromDateDay: jsonData['FromDateDay'],
      fromDateHour: jsonData['FromDateHour'],
      fromDateMonth: jsonData['FromDateMonth'],
      fromDateYear: jsonData['FromDateYear'],
      toDateDay: jsonData['TODateDay'],
      toDateHour: jsonData['TODateHour'],
      toDateMonth: jsonData['TODateMonth'],
      toDateYear: jsonData['TODateYear'],
      bookingPrice: jsonData['bookingPrice'],
      currency: jsonData['currency'],
      isPaid: jsonData['isPaid'],
    );
  }
}
