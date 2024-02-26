import 'package:flutter/material.dart';

import '../../../Constants/Themes.dart';

class Notes extends StatelessWidget {
  const Notes({super.key, required this.note});

  final String note;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
      child: Text(
        note,
        style: Themes.labelMedium,
      ),
    );
  }
}
