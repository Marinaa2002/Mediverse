import 'package:flutter/material.dart';
import 'package:mediverse/Constants/Themes.dart';

class NameIconChat extends StatelessWidget {
  const NameIconChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ahmed Hassan",
              style: TextStyle(
                fontSize: 18.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "online",
              style: Themes.bodysmall,
            ),
          ],
        ),
      ),
    );
  }
}
