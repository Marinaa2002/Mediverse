class Booking {
  const Booking({
    required this.id,
    required this.Doctor_id,
    required this.Patient_id,
    required this.Date,
    required this.Day,
    required this.Time,
    required this.Location,
    required this.State,
  });

  final String id;
  final String Doctor_id;
  final String Patient_id;
  final String Date;
  final String Day;
  final String Time;
  final String Location;
  final String State;


  Map<String, dynamic> toMap() {
    return {
      'Doctor_id': Doctor_id,
      'Patient_id': Patient_id,
      'Date': Date,
      'Day': Day,
      'Time': Time,
      'Location': Location,
      'State': State,
    };

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
