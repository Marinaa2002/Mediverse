
import 'package:flutter/cupertino.dart';

import '../conts/Themes.dart';

class titleText extends StatelessWidget {
  final text;
  const titleText({
    super.key, required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
      child: Text(
          text,
          style:Themes.headline
      ),
    );
  }
}

