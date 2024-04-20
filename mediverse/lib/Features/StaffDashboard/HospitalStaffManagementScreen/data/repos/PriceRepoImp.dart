import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/src/either.dart';
import 'package:mediverse/Core/Errors/Failure.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/data/models/PricesModel.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/data/models/SlotsModel.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/data/repos/PricesRepo.dart';

class PriceRepoImp extends PriceRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, PriceModel>> getPrices() async {
    try {
      DocumentSnapshot documentSnapshot =
          await FirebaseFirestore.instance.collection('Prices').doc('A').get();
      if (documentSnapshot.exists) {
        // Access the specific field from the document
        String cost = documentSnapshot['Cost'];
        String d_uid = documentSnapshot['D_uid'];

        return Right(PriceModel(dUid: d_uid, cost: cost));
      } else {
        return Right(PriceModel(cost: '0', dUid: '0'));
      }
    } catch (e) {
      return Left(
        ServerFailure(errMsg: e.toString()),
      );
    }
  }
}
