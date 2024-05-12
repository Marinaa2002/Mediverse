import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../data/Repos/AdminProfileRepo.dart';

part 'admin_profile_edit_state.dart';

class AdminProfileEditCubit extends Cubit<AdminProfileEditState> {
  AdminProfileEditCubit(this.editInfoRepo) : super(AdminProfileEditInitial());
  var details = FirebaseFirestore.instance.collection('Admins');

  final AdminProfileRepo editInfoRepo;

  Future<void> editName({required String? name}) async {
    emit(AdminProfileEditSuccess());
    try {
      editInfoRepo.updateName(name: name);
    } on Exception catch (e) {
      emit(AdminProfileEditFailure('Something went wrong, Try again'));
    }
  }

  Future<void> editPhoneNum({required String? phoneNum}) async {
    emit(AdminProfileEditSuccess());
    try {
      editInfoRepo.updatePhoneNum(phoneNum: phoneNum);
    } on Exception catch (e) {
      emit(AdminProfileEditFailure('Something went wrong, Try again'));
    }
  }

  Future<void> editPicture({required String? picture}) async {
    emit(AdminProfileEditLoading());
    try {
      editInfoRepo.updatePicture(picture: picture);
      emit(AdminProfileEditSuccess());
    } on Exception catch (e) {
      emit(AdminProfileEditFailure('Something went wrong, Try again'));
    }
  }

  Future<void> editEmail({required String? email}) async {
    emit(AdminProfileEditSuccess());
    try {
      editInfoRepo.updateEmail(email: email);
    } on Exception catch (e) {
      emit(AdminProfileEditFailure('Something went wrong, Try again'));
    }
  }
}
