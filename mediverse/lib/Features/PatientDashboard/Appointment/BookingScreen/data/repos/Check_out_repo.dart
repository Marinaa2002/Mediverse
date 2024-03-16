import 'package:either_dart/either.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/data/models/PaymentIndentInputModel.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}

abstract class Failure {
  final String errMsg;

  Failure({required this.errMsg});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMsg});
}
