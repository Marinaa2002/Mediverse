import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:mediverse/AllModels/doctor.dart';
import '../../../../../AllModels/patient.dart';
import '../../../../../Core/Errors/Failure.dart';

abstract class SignUpInfoRepo{

  signUpInfoPatient({required String? uid,required String name, required String age, required String email, required String national_id});
  // Future<Either<Failure , List<Patient>>> getInfoPatient({required QuerySnapshot event});
}