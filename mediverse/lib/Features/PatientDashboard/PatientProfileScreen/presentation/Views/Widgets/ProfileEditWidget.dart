import 'package:flutter/material.dart';

import '../../../../../../Constants/Themes.dart';
import '../../../../../../Constants/constant.dart';
import '../../../../../Beginning/LoginScreen/presentation/views/widgets/LoginButtonWidget.dart';
import '../../../../../Beginning/LoginScreen/presentation/views/widgets/TextFormFieldPassWidget.dart';
import '../../../../../Beginning/LoginScreen/presentation/views/widgets/TextFormFieldWidget.dart';

class ProfileEditWidget extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController natIDController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  String? name;
  String? age;
  String? national_id;
  String? phoneNum;
  bool isLoading = false;
  ProfileEditWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: kSecondryBackgroundColor,
            size: 24,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Edit Profile',
          style: Themes.headlineMedium.copyWith(
            color: backgroundColor,
            fontSize: 22,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: Form(
          key: formKey,
          child: Column(
            children: [
              Align(
                alignment: const AlignmentDirectional(-1, -1),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15, 20, 0, 10),
                  child: Text('Change Your name:',
                      style: Themes.titleButton),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 20),
                child: TextFormFieldWidget(
                  text: "Name",
                  validator: (value) {
                    // if (value!.isEmpty) {
                    //   return 'Field is required';
                    // } else if (!value.contains('@')) {
                    //   return 'Formatted Email is required';
                    // }
                  },
                  onChanged: (value) {
                    name = value;
                  },
                  controller: nameController,
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1, -1),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 0, 10),
                  child: Text('Change Your Age:',
                      style: Themes.titleButton),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 20),
                child: TextFormFieldWidget(
                  text: "Age",
                  validator: (value) {
                    // if (value!.isEmpty) {
                    //   return 'Field is required';
                    // }
                  },
                  onChanged: (value) {
                    age = value;
                  }, controller: ageController,
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1, -1),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 0, 10),
                  child: Text('Change Your Phone Number:',
                      style: Themes.titleButton),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 20),
                child: TextFormFieldWidget(
                  text: "Phone Number",
                  validator: (value) {
                    // if (value!.isEmpty) {
                    //   return 'Field is required';
                    // }
                  },
                  onChanged: (value) {
                    phoneNum = value;
                  }, controller: phoneNumController,
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1, -1),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 0, 10),
                  child: Text('Change Your National ID:',
                      style: Themes.titleButton),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 10),
                child: TextFormFieldWidget(
                  text: "National ID",
                  validator: (value) {
                    // if (value!.isEmpty) {
                    //   return 'Field is required';
                    // }
                  },
                  onChanged: (value) {
                    national_id = value;
                  }, controller: natIDController,
                ),
              ),
              LoginButtonWidget(
                text: "Save",
                screen: null,
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    // BlocProvider.of<LoginCubit>(context)
                    //     .loginUser(email: email!, password: password!);
                  } else {}
                },
              ),
            ],
          )),
    );
  }
}
