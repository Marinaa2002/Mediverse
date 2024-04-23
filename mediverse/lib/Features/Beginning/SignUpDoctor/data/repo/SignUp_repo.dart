import 'package:mediverse/AllModels/requestModel.dart';

abstract class SignUpDocInfoRepo {
  signUpInfoDoctor({required RequestModel requestModel, required String id});
  // Future<Either<Failure , List<Doctor>>> getInfoDoctor({required QuerySnapshot event});
}
