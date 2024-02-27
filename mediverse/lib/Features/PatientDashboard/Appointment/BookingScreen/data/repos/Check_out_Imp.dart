import 'package:either_dart/src/either.dart';
import 'package:mediverse/Core/utils/StripeService.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/data/models/PaymentIndentInputModel.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/data/repos/Check_out_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService service = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    // TODO: implement makePayment
    try {
      await service.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return const Right(null);
    } catch (e) {
      return Left(
        ServerFailure(errMsg: "Errorrr"),
      );
    }
  }
}
