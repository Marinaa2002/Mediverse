import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';

class HospitalAddHideWidget extends StatelessWidget {
  const HospitalAddHideWidget({
    super.key,
    required this.hospitalName,
    required this.onChanged,
    this.option = true,
  });
  final hospitalName;
  final void Function(bool) onChanged;
  final option;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: backgroundColor,
        ),
        height: 100,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                child: Text(
                  hospitalName,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 12, 0, 0),
              child: Text(
                'Archive',
                textAlign: TextAlign.start,
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(1, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: SwitchWidget(option: option, onChanged: onChanged),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
              child: Text(
                'Show',
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

bool isSwitchWidget = false;

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({
    super.key,
    required this.option,
    required this.onChanged,
  });

  final bool option;
  final void Function(bool p1) onChanged;

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  void update() {
    setState(() {
      isSwitchWidget = !isSwitchWidget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(value: widget.option, onChanged: widget.onChanged);
  }
}
