
abstract class SignUpDocInfoRepo{

  signUpInfoDoctor({required String? uid, required String name, required String age, required String email, required String national_id, required String hospital, required String licNo,required String speciality});
  // Future<Either<Failure , List<Doctor>>> getInfoDoctor({required QuerySnapshot event});
}