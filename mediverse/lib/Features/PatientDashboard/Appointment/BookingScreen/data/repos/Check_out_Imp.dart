import 'package:either_dart/src/either.dart';
import 'package:mediverse/Core/utils/StripeService.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/data/models/PaymentIndentInputModel.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/data/repos/Check_out_repo.dart';

import '../../../../../../Core/Errors/Failure.dart';

class CheckoutRepoImpl extends CheckOutRepo {
  final StripeService service = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await service.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return const Right(null);
    } catch (e) {
      return Left(
        ServerFailure(errMsg: e.toString()),
      );
    }
  }
}
