
class BookingsModel {
  final String name;
  final String age;
  final String patientId;
  final String email;
  final String profilePicture;
  final String date;
  final List<Map<String, String>> medicalHistory;

  BookingsModel({
    required this.name,
    required this.patientId,
    required this.email,
    required this.profilePicture,
    required this.medicalHistory,
    required this.date,
    required this.age
  });

  factory BookingsModel.fromJson(Map<String, dynamic> bookingData) {
    return BookingsModel(
      name: bookingData['Name'] ?? '',
      patientId: bookingData['Patient_id'] ?? '',
      email: bookingData['Email'] ?? '',
      profilePicture: bookingData['Profile Picture'] ?? '',
      medicalHistory: List<Map<String, String>>.from(
        (bookingData['Medical Record'] ?? []).map((item) => Map<String, String>.from(item)),
      ),
      date:bookingData['Date']?? '', age:bookingData['Age']??'',
    );
  }
}
