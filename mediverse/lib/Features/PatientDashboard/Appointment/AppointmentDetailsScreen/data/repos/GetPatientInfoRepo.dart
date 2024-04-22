import 'package:either_dart/either.dart';
import 'package:mediverse/AllModels/patient.dart';
import 'package:mediverse/Core/Errors/Failure.dart';

abstract class GetPatientInfoRepo {
  Future<Either<Failure, Patient>> getPatientInfoFunction(String id);
}
