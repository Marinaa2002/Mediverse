import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/src/either.dart';
import 'package:mediverse/AllModels/Staff.dart';
import 'package:mediverse/AllModels/admin.dart';
import 'package:mediverse/AllModels/doctor.dart';

import 'package:mediverse/Features/StaffDashboard/AdminMainScreen/data/repos/FetechAdminInformationRepo.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreenAddDoctors/data/repos/FetechHMInformationRepo.dart';

import '../../../../../../Core/Errors/Failure.dart';

class FetechHMRepoImp extends FetechHMRepo {
  @override
  Future<Either<Failure, Admin>> getAdminInfoFunction(String id) async {
    try {
      final DocumentReference adminRef =
          FirebaseFirestore.instance.collection('Admins').doc(id);

      final snapshot = await adminRef.get();

      if (snapshot.exists) {
        final adminData = snapshot.data();
        if (adminData is Map<String, dynamic>) {
          final admin = Admin.fromJson(adminData);
          // Perform further actions with the doctor object if needed
          return Right(admin); // Success
        }
      }
      return Left(ServerFailure(errMsg: 'Doctor with ID $id does not exist.'));
    } catch (e) {
      return Left(ServerFailure(errMsg: 'Failed to get doctor data: $e'));
    }
  }

  @override
  Future<Either<Failure, StaffModel>> getHMInfoFunction(String id) async {
      try {
      final DocumentReference staffRef =
          FirebaseFirestore.instance.collection('Staff').doc(id);

      final snapshot = await staffRef.get();

      if (snapshot.exists) {
        final staffData = snapshot.data();
        if (staffData is Map<String, dynamic>) {
          final staff = StaffModel.fromJson(staffData);
          // Perform further actions with the doctor object if needed
          return Right(staff); // Success
        }
      }
      return Left(ServerFailure(errMsg: 'Doctor with ID $id does not exist.'));
    } catch (e) {
      return Left(ServerFailure(errMsg: 'Failed to get doctor data: $e'));
    }
  }
}
