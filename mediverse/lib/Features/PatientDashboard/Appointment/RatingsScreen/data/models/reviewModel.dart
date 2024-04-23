import 'dart:ffi';

class ReviewModel {
  ReviewModel(
      this.Doctor_id,
     this.Patient_id,
     this.Rating,
     this.text,
      this.name,
  );

  final String Doctor_id;
  final String Patient_id;
  double Rating;
  final String text;
  final String name;

  factory ReviewModel.fromJson( jsonData){
    return ReviewModel(jsonData['Doctor_id'], jsonData['Patient_id']
        , jsonData['Rating'], jsonData['Text'], jsonData['Name']);
  }
}
