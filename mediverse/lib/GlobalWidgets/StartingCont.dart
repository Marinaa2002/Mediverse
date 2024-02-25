import 'package:flutter/cupertino.dart';

import '../Constants/constant.dart';

class startingCont extends StatelessWidget {
  const startingCont({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primaryColor,
            errorColor,
            tertiary,
          ],
          stops: [0, 0.5, 1],
          begin: AlignmentDirectional(-1, -1),
          end: AlignmentDirectional(1, 0),
        ),
      ),
      child: Container(
        width: 100,
        height: MediaQuery.of(context).size.height / 2,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [cyan, white],
            stops: [0, 0.4],
            begin: AlignmentDirectional(0, -1),
            end: AlignmentDirectional(0, 1),
          ),
        ),
      ),
    );
  }
}
