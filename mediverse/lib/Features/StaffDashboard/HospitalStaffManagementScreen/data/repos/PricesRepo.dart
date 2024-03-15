import 'package:either_dart/either.dart';
import 'package:mediverse/Core/Errors/Failure.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/data/models/PricesModel.dart';
import 'package:mediverse/Features/StaffDashboard/HospitalStaffManagementScreen/data/models/SlotsModel.dart';

abstract class PriceRepo {
  Future<Either<Failure, PriceModel>> getPrices();
}
