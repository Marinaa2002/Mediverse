import 'package:flutter/material.dart';
import 'package:mediverse/Constants/constant.dart';

import 'package:mediverse/Features/PatientDashboard/Widgets/NoteViewBody.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/add_note_bottom_sheet.dart';

class DrNotesScreen extends StatelessWidget {
  const DrNotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        leading: const Icon(Icons.arrow_back),
        title: const Text("My medical Notes"),
        centerTitle: true,
      ),
      backgroundColor: kSecondryBackgroundColor,
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kprimaryColor,
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: kSecondryBackgroundColor,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context,
              builder: (context) {
                return const AddNoteBottomSheet();
              });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: const NotesViewBody(),
    );
  }
}
