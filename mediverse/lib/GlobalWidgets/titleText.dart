import 'package:flutter/cupertino.dart';

import '../Constants/Themes.dart';

class titleText extends StatelessWidget {
  final String text;
  const titleText({Key? key, required this.text});

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.width * 0.025),
      child: Text(text, style: Themes.headline),
    );
  }
}
