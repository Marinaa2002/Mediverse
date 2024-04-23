import 'package:mediverse/AllModels/patient.dart';

abstract class SignUpInfoRepo {
  signUpInfoPatient({required Patient patient});
  // Future<Either<Failure , List<Patient>>> getInfoPatient({required QuerySnapshot event});
}
