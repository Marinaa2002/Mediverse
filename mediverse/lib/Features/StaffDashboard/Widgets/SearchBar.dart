import 'package:flutter/material.dart';
import '../../../Constants/constant.dart';
import 'TextFormFieldDoctors.dart';

class SearchBarProject extends StatelessWidget {
  final TextEditingController searchController;

  const SearchBarProject({
    Key? key,
    required this.searchController,
    required this.onSearchTextChanged,
  }) : super(key: key);

  final Function(String) onSearchTextChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: TextField(
          controller: searchController,
          onChanged: onSearchTextChanged,
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }

  void _openKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
