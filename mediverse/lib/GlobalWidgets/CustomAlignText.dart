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
    return Align(
      alignment: AlignmentDirectional(-1, -1),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 10),
        child: Text(text, style: Themes.labelMed),
      ),
    );
  }
}
