class AdminProfileModel {
  String name;
  String email;
  String phoneNumber;
  String profilePicture;

  AdminProfileModel(this.name, this.email,
      this.phoneNumber, this.profilePicture);

  factory AdminProfileModel.fromJson(jsonData) {
    return AdminProfileModel(
        jsonData['Name'],
        jsonData['Email'],
        jsonData['Phone'],
        jsonData['imageUrl']);
  }
}
