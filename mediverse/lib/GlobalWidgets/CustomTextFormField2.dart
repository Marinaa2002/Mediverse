import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants/Themes.dart';
import '../Constants/constant.dart';

class CustomTextFormField2 extends StatelessWidget {
  final int selectedIndex;
  final List<String> items;
  final String? value;
  final void Function(String?)? onChanged;

  CustomTextFormField2({
    Key? key,
    required this.selectedIndex,
    required this.items,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.95,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFE0E3E7), width: 2),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: DropdownButton<String>(
          value: value,
          onChanged: onChanged,
          items: items.map((option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(
                option,
                style: Themes.fieldText,
              ),
            );
          }).toList(),
          isExpanded: true,
          icon: Icon(Icons.arrow_drop_down_outlined, weight: 27),
          iconSize: 24,
          iconEnabledColor: Color(0xFF57636C),
          underline: SizedBox(),
        ),
      ),
    );
  }
}