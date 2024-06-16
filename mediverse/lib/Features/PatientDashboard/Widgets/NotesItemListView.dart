import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/DrNotesScreen/data/models/NoteModel.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/DrNotesScreen/presentation/Manager/NotesCubit/NotesCubit.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/DrNotesScreen/presentation/Manager/NotesCubit/NotesState.dart';
import 'package:mediverse/Features/PatientDashboard/Widgets/NoteItem.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        // reversing the list
        var objList = notes.reversed;

        // creating a new list with the object
        notes = new List.from(objList);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
              itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: NoteItem(
                    note: notes[index],
                  ),
                );
              }),
        );
      },
    );
  }
}
