import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/data/login_repo.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/data/login_repo_impl.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/Manager/forgetPassword_cubit/forget_password_cubit.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/Manager/login_cubit/login_cubit.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/LoginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ForgetPasswordCubit(LoginRepoImpl()),),
        BlocProvider(create: (context) => LoginCubit(LoginRepoImpl(),),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LoginScreen.id: (context) => LoginScreen()
        },
        initialRoute: LoginScreen.id,
      ),
    );
  }
}
