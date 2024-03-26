import 'package:flutter/material.dart';

import '../../../Constants/Themes.dart';

class RateWidget extends StatelessWidget {
  const RateWidget(
      {super.key,
      required this.rating,
      required this.size,
      required this.ratingCount});
  final double? rating;
  final double size;
  final int ratingCount;
  @override
  Widget build(BuildContext context) {
    List<Widget> _starList = [];

    int realNumber = rating!.floor();
    int partNumber = ((rating! - realNumber) * 10).ceil();

    for (int i = 0; i < 5; i++) {
      if (i < realNumber) {
        _starList.add(Icon(Icons.star, color: Colors.yellow, size: size));
      } else if (i == realNumber) {
        _starList.add(SizedBox(
          height: size,
          width: size,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Icon(Icons.star, color: Colors.yellow, size: size),
              ClipRect(
                clipper: _Clipper(part: partNumber),
                child: Icon(Icons.star, color: Colors.grey, size: size),
              )
            ],
          ),
        ));
      } else {
        _starList.add(Icon(Icons.star, color: Colors.grey, size: size));
      }
    }
    ratingCount != null
        ? _starList.add(
            Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text('($ratingCount)',
                    style: TextStyle(
                        fontSize: size * 0.8,
                        color: Theme.of(context).disabledColor))),
          )
        : const SizedBox();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: _starList,
    );
  }
}

class _Clipper extends CustomClipper<Rect> {
  final int part;

  _Clipper({required this.part});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(
      (size.width / 10) * part,
      0.0,
      size.width,
      size.height,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => true;
}
