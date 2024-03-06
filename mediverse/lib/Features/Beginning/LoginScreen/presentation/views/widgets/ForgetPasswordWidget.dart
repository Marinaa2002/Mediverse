import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/LoginScreen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../Manager/forgetPassword_cubit/forget_password_cubit.dart';

class ForgetPasswordWidget extends StatelessWidget {
  ForgetPasswordWidget({
    super.key,
    required this.forgetPassController,
    required this.isLoad
  });

  final TextEditingController forgetPassController;
  bool isLoad = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) async{
        if(state is ForgetPasswordLoading){
          isLoad = true;
        } else if (state is ForgetPasswordSuccess) {
          await AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: 'Success',
            desc: 'Email Sent',
          ).show();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => LoginScreen(),));
          isLoad = false;
        } else if (state is ForgetPasswordFailure){
          print('Forget Password Failure');
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Error',
            desc: state.errMessage,
          ).show();
          isLoad = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoad,
          child: GestureDetector(
            onTap: () async {
              var forgetPass = forgetPassController.text.trim();
              if (forgetPass.isEmpty) {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  animType: AnimType.rightSlide,
                  title: 'Error',
                  desc: 'Please write your Email',
                ).show();
                return;
              }
              await BlocProvider.of<ForgetPasswordCubit>(context).forgetPassword(email: forgetPass);
            },
            child: Align(
              alignment: const AlignmentDirectional(-1, -1),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    0, 6, 0, 12),
                child: Center(
                  child: Text('Forget Password?',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 14,
                          color: Colors.black)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}