import 'package:flutter/material.dart';

import '../../../Constants/constant.dart';
import 'RowImageAndText.dart';

class ActionDetailsWidget extends StatelessWidget {
  const ActionDetailsWidget(
      {super.key, required this.text, required this.imageUrl});
  final String text;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      width: size.width*0.95,
      decoration: BoxDecoration(
        color: kSecondryBackgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: kSecondryBackgroundColor,
          width: 2,
        ),
      ),
      alignment: const AlignmentDirectional(0, 0),
      child: Align(
        alignment: const AlignmentDirectional(0, 0),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: RowImageAndText(
            text: text,
            imageUrl: imageUrl,
          ),
        ),
      ),
    );
  }
}
