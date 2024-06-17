import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/LoginScreen.dart';
import 'package:mediverse/GlobalWidgets/StartingCont.dart';
import '../../../../../GlobalWidgets/CustomSignUpLogin.dart';
import '../../../../../GlobalWidgets/CustomTextFormField.dart';
import '../../../../../GlobalWidgets/CustomTextFormField3.dart';
import '../../../../../GlobalWidgets/LogoContainer.dart';
import '../../../../../GlobalWidgets/titleText.dart';
import '../Manager/sign_up_cubit/sign_up_cubit.dart';

class PatientSignUpScreen extends StatefulWidget {
  const PatientSignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PatientSignUpScreenState();
}

class _PatientSignUpScreenState extends State<PatientSignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController natIDController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  String? email;
  String? password;
  String? name;
  String? age;
  String? national_id;
  String? phoneNum;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          isLoading = true;
        } else if (state is SignUpSuccess) {
          isLoading = false;
        } else if (state is SignUpFailure) {
          showSnackbar(context, state.errMsg);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.pop(context);
                // popUntilRoute(context, '/registerChoice');
              },
            ),
          ),
          body: Form(
            key: formKey,
            child: Stack(
              children: [
                startingCont(),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 88,
                          ),
                          Padding(
                            padding: EdgeInsets.all(30),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 70,
                                ),
                                LogoCont(),
                                titleText(
                                  text: "Patient Sign Up",
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: CustomTextFormField(
                          text: "Name",
                          TextEditingController: nameController,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: CustomTextFormField(
                          text: "Age",
                          TextEditingController: ageController,
                          // icon: Icon(
                          //   Icons.arrow_drop_down_sharp,
                          //   size: 30,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: CustomTextFormField(
                          text: "Phone Number",
                          TextEditingController: phoneNumController,
                          // icon: Icon(
                          //   Icons.arrow_drop_down_sharp,
                          //   size: 30,
                          // ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: CustomTextFormField(
                          text: "National ID",
                          TextEditingController: natIDController,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: CustomTextFormField(
                          TextEditingController: emailController,
                          text: "Email",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: CustomTextFormField3(
                          text: "Password",
                          controller: passwordController,
                        ),
                      ),
                      CustomSignUpLogin(
                        text: "Sign Up",
                        onTap: () async {
                          name = nameController.text.trim();
                          age = ageController.text.trim();
                          national_id = natIDController.text.trim();
                          email = emailController.text.trim();
                          password = passwordController.text.trim();
                          phoneNum = phoneNumController.text.trim();
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<SignUpCubit>(context)
                                .signUpUser(email: email!, password: password!);
                            BlocProvider.of<SignUpCubit>(context)
                                .signUpInfoPatient(
                              name: name!,
                              age: age!,
                              phoneNum: phoneNum!,
                              national_id: national_id!,
                              email: email!,
                              password: password!,
                            );
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          }
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
