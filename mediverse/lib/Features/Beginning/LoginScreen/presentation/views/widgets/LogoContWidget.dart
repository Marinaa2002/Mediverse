import 'package:flutter/cupertino.dart';

class LogoContWidget extends StatelessWidget {
  const LogoContWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.24,
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xF4FAFC),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          'assets/images/logo2.png',
          // width: size.width*0.24,
          // height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}