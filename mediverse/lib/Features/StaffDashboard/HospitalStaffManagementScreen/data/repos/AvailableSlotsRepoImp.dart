import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/src/either.dart';
import 'package:mediverse/Core/Errors/Failure.dart';
import 'package:mediverse/Core/utils/StripeService.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/data/models/PaymentIndentInputModel.dart';
import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/data/repos/Check_out_repo.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/data/models/SlotsModel.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/data/repos/AvailableSlotsRepo.dart';

class AvailableSlotsRepoImp extends AvailableSlotsRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, List<SlotsModel>>> availableSlotsReterival() async {
    try {
      DateTime now = DateTime.now();
      int currentMonth = now.month;
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(
            'Appointments',
          )
          .where(
            'FromDateMonth',
            isEqualTo: currentMonth,
          )
          .orderBy(
            'FromDateDay',
            descending: false,
          )
          .get();
      List<SlotsModel> slots =
          querySnapshot.docs.map((doc) => SlotsModel.fromJson(doc)).toList();
      if (slots.isEmpty) {
        return const Right([]);
      }
      return Right(slots);
    } catch (e) {
      return Left(
        ServerFailure(errMsg: e.toString()),
      );
    }
  }
}
