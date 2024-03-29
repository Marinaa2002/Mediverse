import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mediverse/Core/utils/api_keys.dart';
import 'package:mediverse/Features/Beginning/FormStaff/presentation/Manager/staff_request_cubit.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/data/repo/login_repo_impl.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/Manager/forgetPassword_cubit/forget_password_cubit.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/Manager/login_cubit/login_cubit.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/LoginScreen.dart';
import 'package:mediverse/Features/Beginning/SignUpDoctor/presentation/Manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:mediverse/Features/Beginning/SignUpPatient/presentation/Manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:mediverse/Features/Beginning/splashScreen/splashScreen.dart';

import 'Features/PatientDashboard/MainScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
      MultiBlocProvider(providers:[
        BlocProvider(create:(context)=>SignUpCubit()),
        BlocProvider(create:(context)=>SignUpDocCubit()),
        BlocProvider(create:(context)=>StaffRequestCubit()),
        BlocProvider(create:(context) => ForgetPasswordCubit(LoginRepoImpl()),),
        BlocProvider(create:(context) => LoginCubit(LoginRepoImpl()),),
      ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          routes: {
            LoginScreen.id: (context) => LoginScreen()
          },
          initialRoute: LoginScreen.id,
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      );
  }
}
