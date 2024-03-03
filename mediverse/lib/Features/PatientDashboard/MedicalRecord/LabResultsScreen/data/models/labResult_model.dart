class LabResultModel{
  final String imageUrl;
  final String pictureDate;

  LabResultModel(this.imageUrl, this.pictureDate);

  factory LabResultModel.fromJson( jsonData){
    return LabResultModel(jsonData['imageUrl'], jsonData['pictureDate']);
  }
}