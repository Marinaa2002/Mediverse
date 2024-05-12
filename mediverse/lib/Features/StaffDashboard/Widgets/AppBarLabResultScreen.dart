import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mediverse/Features/Beginning/LoginScreen/presentation/views/LoginScreen.dart';

import '../../../Constants/Themes.dart';

class AppBarLabResultScreen extends StatelessWidget {
  const AppBarLabResultScreen({super.key, this.lab_name = 'Lab Page'});
  final String lab_name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Center(
            child: Text(
              lab_name,
              style: Themes.headlineSmall,
            ),
          ),
        ),
        GestureDetector(
          child: Icon(color: Colors.white, Icons.logout),
          onTap: () {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.warning,
              animType: AnimType.rightSlide,
              //title: 'Error',
              title: 'Are you sure you want to Logout?',
              titleTextStyle:
                  TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              btnOkOnPress: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              },
              btnCancelOnPress: () {
                //Navigator.pop(context);
              },
            ).show();
          },
        ),
      ],
    );
  }
}
