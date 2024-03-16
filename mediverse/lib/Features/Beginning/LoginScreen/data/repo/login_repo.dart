import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../../Core/Errors/Failure.dart';

abstract class LoginRepo{
  Future<Either<Failure , UserCredential>> loginUser({required String email, required String password});
  Future<Either<Failure , void>> forgetPassword({required String email});
}