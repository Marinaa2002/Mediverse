import 'package:flutter/cupertino.dart';
import '../Constants/Themes.dart';

class CustomSignUpWith extends StatelessWidget {
  const CustomSignUpWith({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: 16),
        child: Text('Or sign up with',
            textAlign: TextAlign.center, style: Themes.fieldText),
      ),
    );
  }
}
