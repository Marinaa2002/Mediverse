import 'package:either_dart/either.dart';
import 'package:mediverse/AllModels/Staff.dart';
import 'package:mediverse/Core/Errors/Failure.dart';

abstract class FetechHMRepo {
  Future<Either<Failure, StaffModel>> getHMInfoFunction(String id);
}
