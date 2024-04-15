import 'package:bloc/bloc.dart';
import 'package:mediverse/AllModels/Staff.dart';
import 'package:mediverse/Features/StaffDashboard/AdminMainScreen/data/repos/AddHideRepo.dart';
import 'package:mediverse/Features/StaffDashboard/AdminMainScreen/presentation/Manager/AddHideCubit/AddHideState.dart';
import 'package:mediverse/Features/StaffDashboard/AdminMainScreen/presentation/Manager/AddHideCubit/AddHideState.dart';

class AddHideCubit extends Cubit<AddHideState> {
  AddHideCubit(this.addHideRepo) : super(AddHideStateInitial());
  final AddHideRepo addHideRepo;

  Future<void> getAddHideFunction(StaffModel staffModel) async {
    emit(AddHideStateLoading());
    var data = await addHideRepo.getAddOrHide(staffModel);
    data.fold(
        (left) => emit(AddHideStateFailure(
              errMsg: left.errMsg,
            )), (right) {
      emit(AddHideStateSuccess(right));
    });
  }
}
