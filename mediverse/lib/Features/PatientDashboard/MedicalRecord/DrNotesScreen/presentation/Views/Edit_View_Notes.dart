import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/DrNotesScreen/data/models/NoteModel.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/DrNotesScreen/presentation/Manager/NotesCubit/NotesCubit.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/EditViewBody.dart';
import 'package:mediverse/main.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({Key? key, required this.note}) : super(key: key);

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondryBackgroundColor,
      appBar: AppBar(
        title: const Text(
          "Edit Notes",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: kprimaryColor,
        actions: [
          IconButton(
            color: Colors.black,
            icon: const Icon(
              Icons.check,
              color: Colors.white,
            ), // Example icon (replace with your desired icon)
            onPressed: () {
              note.title = titleNotesScreen ?? note.title;
              note.subTitle = contentNotesScreen ?? note.subTitle;
              note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              titleNotesScreen = "";
              contentNotesScreen = "";
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: EditNoteViewBody(
        note: note,
      ),
    );
  }
}
