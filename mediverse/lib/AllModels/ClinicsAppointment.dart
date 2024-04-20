class ClinicAppointments {
  final Map<String, Map<String, String>>? appointments;

  ClinicAppointments({
    this.appointments,
  });

  factory ClinicAppointments.fromJson(Map<String, dynamic> json) {
    return ClinicAppointments(
      appointments: json.map(
        (key, value) => MapEntry(
          key,
          Map<String, String>.from(value as Map<String, dynamic>),
        ),
      ),
    );
  }
}
