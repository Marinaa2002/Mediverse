import 'package:flutter/cupertino.dart';

import 'package:mediverse/Constants/Themes.dart';
import 'package:mediverse/Constants/constant.dart';

class AlignText extends StatelessWidget {
  final text;
  const AlignText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(size.width * 0.04, 0, 0, 10),
        child: Text(text, style: Themes.labelMed),
      ),
    );
  }
}
