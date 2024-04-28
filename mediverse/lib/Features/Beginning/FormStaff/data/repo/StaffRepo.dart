import 'package:mediverse/AllModels/requestModel.dart';

abstract class StaffRepo {
  sendRequest({required RequestModel requestModel, required String id});
}
