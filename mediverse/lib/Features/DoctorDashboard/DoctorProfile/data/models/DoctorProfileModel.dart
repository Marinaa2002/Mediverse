class DoctorProfileModel {
  String name;
  String age;
  String email;
  String nationalId;
  String phoneNumber;
  String profilePicture;
  String speciality;

  DoctorProfileModel(this.name, this.age, this.email, this.nationalId,
      this.phoneNumber, this.profilePicture, this.speciality);

  factory DoctorProfileModel.fromJson(jsonData) {
    return DoctorProfileModel(
        jsonData['Name'],
        jsonData['Age'],
        jsonData['Email'],
        jsonData['NationalId'],
        jsonData['Phone'],
        jsonData['Profile_Picture'],
        jsonData['Speciality']);
  }
}
