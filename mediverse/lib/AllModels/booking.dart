class Booking {
  const Booking({
    required this.id,
    required this.Doctor_id,
    required this.Patient_id,
    required this.dateTime,
    required this.Location,
    required this.State,
  });

  final String id;
  final String Doctor_id;
  final String Patient_id;
  final DateTime dateTime;
  final String Location;
  final String State;

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      Doctor_id: json['Doctor_id'],
      Patient_id: json['Patient_id'],
      // Convert the date string from JSON to a DateTime object
      dateTime: DateTime.parse(json['dateTime']),
      Location: json['Location'],
      State: json['State'],
    );
  }
}
