import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';

class AppBarRowIconChat extends StatelessWidget {
  const AppBarRowIconChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kprimaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.arrow_back,
            size: 24,
          ),
          const SizedBox(
            width: 10,
          ),
          CircleAvatar(
            radius: 29,
            backgroundColor: Colors.blueGrey,
            child: Image.asset(
              "assets/images/Cash.png",
              color: Colors.white,
              height: 36,
              width: 36,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
