import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';

class DateOfChat extends StatelessWidget {
  const DateOfChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('12/5/2022', style: Themes.DateText),
    );
  }
}
