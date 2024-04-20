import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/src/either.dart';
import 'package:mediverse/AllModels/Staff.dart';
import 'package:mediverse/AllModels/admin.dart';
import 'package:mediverse/AllModels/doctor.dart';
import 'package:mediverse/Features/StaffDashboard/AdminMainScreen/data/repos/AddHideRepo.dart';

import '../../../../../../Core/Errors/Failure.dart';

class AddHideRepoImpl extends AddHideRepo {
  @override
  Future<Either<Failure, bool>> getAddOrHide(StaffModel staff) async {
    try {
      // final DocumentReference staffRef =
      //     FirebaseFirestore.instance.collection('Staff').doc(id);

      // final snapshot = await staffRef.get();

      // if (snapshot.exists) {
      // final staffData = snapshot.data();
      // if (staffData is Map<String, dynamic>) {
      // final staff = StaffModel.fromJson(staffData);

      // Perform further actions with the doctor object if needed
      if (staff.condition == 'Show') {
        return Right(true);
      } else {
        return Right(false);
      }
      // Success
      // }

      // return Left(ServerFailure(errMsg: 'Doctor with ID $id does not exist.'));
    } catch (e) {
      return Left(ServerFailure(errMsg: 'Failed to get  Change condition: $e'));
    }
  }
}
