// Define a model class for Appointment
class PriceModel {
  final String dUid;
  final String cost;

  PriceModel({
    required this.dUid,
    required this.cost,
  });

  // Factory method to create an Appointment object from a Firestore document snapshot
  factory PriceModel.fromJson(jsonData) {
    return PriceModel(
      dUid: jsonData['D_uid'],
      cost: jsonData['Cost'],
    );
  }
}
