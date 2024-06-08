class StaffProfileModel {
  String name;
  String license_Number;
  String org_Name;
  String org_Type;
  String location;
  String email;
  String profilePicture;

  StaffProfileModel(this.name, this.license_Number, this.org_Name, this.org_Type,
      this.location,this.email,  this.profilePicture);

  factory StaffProfileModel.fromJson(jsonData) {
    return StaffProfileModel(
        jsonData['Name'],
        jsonData['License_Number'],
        jsonData['Org Name'],
        jsonData['Org Type'],
        jsonData['Location'],
        jsonData['Email'],
        jsonData['Profile Picture']);
  }
}
