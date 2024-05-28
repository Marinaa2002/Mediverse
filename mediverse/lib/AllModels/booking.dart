class Booking {
  Booking({
    required this.id,
    required this.Doctor_id,
    required this.Patient_id,
    required this.Date,
    required this.Day,
    required this.Time,
    required this.Location,
    required this.Cost,
    required this.State,
  });

  final String id;
  final String Doctor_id;
  final String Patient_id;
  final String Date;
  final String Day;
  final String Time;
  final String Location;
  final String Cost;
  String State;

  Map<String, dynamic> toMap() {
    return {
      'Doctor_id': Doctor_id,
      'Patient_id': Patient_id,
      'Date': Date,
      'Day': Day,
      'Time': Time,
      'Location': Location,
      'Cost': Cost,
      'State': State,
    };
  }

  factory Booking.fromJson(jsonData, String id) {
    return Booking(
      id: id,
      Doctor_id: jsonData['Doctor_id'],
      Patient_id: jsonData['Patient_id'],
      // Convert the date string from jsonData to a DateTime object
      //dateTime: DateTime.parse(jsonData['dateTime']),
      Day: jsonData['Day'],
      Date: jsonData['Date'],
      Time: jsonData['Time'],
      Location: jsonData['Location'],
      Cost: jsonData['Cost'],
      State: jsonData['State'],
    );
  }
}
