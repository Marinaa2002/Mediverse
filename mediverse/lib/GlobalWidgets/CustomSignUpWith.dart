import 'package:flutter/cupertino.dart';
import '../Constants/Themes.dart';

class CustomSignUpWith extends StatelessWidget {
  const CustomSignUpWith({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
        child: Text('Or sign up with',
            textAlign: TextAlign.center, style: Themes.fieldText),
      ),
    );
  }
}
