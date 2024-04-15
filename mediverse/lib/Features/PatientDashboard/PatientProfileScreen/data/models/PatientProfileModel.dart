class PatientProfileModel{
  final String name;
  final String age;
  final String email;
  final String nationalId;
  final String phoneNumber;
  final String profilePicture;

  PatientProfileModel(this.name, this.age, this.email, this.nationalId, this.phoneNumber, this.profilePicture);

  factory PatientProfileModel.fromJson( jsonData){
    return PatientProfileModel( jsonData['Name'], jsonData['Age'], jsonData['Email'],
    jsonData['NationalId'], jsonData['Phone Number'], jsonData['Profile Picture']);
  }
}