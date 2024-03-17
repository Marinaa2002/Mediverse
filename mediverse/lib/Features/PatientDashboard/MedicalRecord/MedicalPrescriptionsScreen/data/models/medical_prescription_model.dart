class MedicalPrescriptionModel{
  final String imageUrl;
  final String pictureDate;

  MedicalPrescriptionModel(this.imageUrl, this.pictureDate);

  factory MedicalPrescriptionModel.fromJson( jsonData){
    return MedicalPrescriptionModel(jsonData['imageUrl'], jsonData['pictureDate']);
  }
}