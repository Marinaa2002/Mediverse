class StaffModel {
  String id;
  String email;
  String name;
  String licenseNumber;
  String location;
  String orgName;
  String orgType;
  String staff;
  String condition;

  StaffModel({
    required this.id,
    required this.email,
    required this.name,
    required this.licenseNumber,
    required this.location,
    required this.orgName,
    required this.orgType,
    required this.staff,
    required this.condition,
  });

  factory StaffModel.fromJson(json) {
    return StaffModel(
      id: json['id'],
      email: json['Email'] ??
          '', // Provide default values or handle null if needed
      name: json['Name'] ?? '',
      licenseNumber: json['License_Number'] ?? '',
      location: json['Location'] ?? '',
      orgName: json['Org Name'] ?? '',
      orgType: json['Org Type'] ?? '',
      staff: json['Staff'] ?? '',
      condition: json['Condition'] ?? '',
    );
  }
}
