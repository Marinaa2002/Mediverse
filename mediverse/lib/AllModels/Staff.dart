class StaffModel {
  String email;
  String name;
  String licenseNumber;
  String location;
  String orgName;
  String orgType;
  String staff;
  String profile_Picture;
  String condition;
  List<dynamic> jobs;
  StaffModel({
    required this.email,
    required this.name,
    required this.licenseNumber,
    required this.location,
    required this.orgName,
    required this.profile_Picture,
    required this.orgType,
    required this.staff,
    required this.condition,
    required this.jobs,
  });

  factory StaffModel.fromJson(json) {
    return StaffModel(
      email: json['Email'] ??
          '', // Provide default values or handle null if needed
      name: json['Name'] ?? '',
      licenseNumber: json['License_Number'] ?? '',
      location: json['Location'] ?? '',
      orgName: json['Org Name'] ?? '',
      orgType: json['Org Type'] ?? '',
      staff: json['Staff'] ?? '',
      condition: json['Condition'] ?? '',
      jobs: json['Jobs'] ?? [],
      profile_Picture: json['Profile_Picture'],
    );
  }
}
