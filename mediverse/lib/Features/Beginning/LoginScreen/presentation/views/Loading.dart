import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mediverse/Constants/constant.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSecondryBackgroundColor,
      child: Center(
        child: SpinKitSpinningCircle(
          color: kprimaryColor,
          size: 50,
        ),
      ),
    );
  }
}
