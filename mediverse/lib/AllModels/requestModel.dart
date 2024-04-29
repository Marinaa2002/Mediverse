class RequestModel {
  String email;
  String name;
  String licenseNumber;
  String location;
  String phoneNum;
  String orgName;
  String age;
  String orgType;
  String staff;
  String status;
  String specialty;
  String national_id;

  RequestModel({
    required this.email,
    required this.phoneNum,
    required this.name,
    required this.licenseNumber,
    required this.location,
    required this.orgName,
    required this.orgType,
    required this.staff,
    required this.status,
    required this.specialty,
    required this.age,
    required this.national_id,
  });
  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
        email: json['Email'] as String,
        name: json['Name'] as String,
        licenseNumber: json['License_Number'] as String,
        location: json['Location'] as String,
        orgName: json['Org Name'] as String,
        orgType: json['Org Type'] as String,
        staff: json['Staff'] as String,
        status: json['Status'] as String,
        phoneNum: json['Phone Number'] as String,
        specialty: json['Specialty'] as String,
        age: json['Age'] as String,
        national_id: json['National_Id'] as String);
  }
}
