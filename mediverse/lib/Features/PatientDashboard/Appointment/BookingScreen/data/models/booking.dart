// ignore_for_file: non_constant_identifier_names

class Booking {
  const Booking({
    required this.id,
    required this.doctor_id,
    required this.patient_id,
    required this.dateTime,
    required this.location,
    required this.state,
  });

  final String id;
  final String doctor_id;
  final String patient_id;
  final DateTime dateTime;
  final String location;
  final String state;
}
