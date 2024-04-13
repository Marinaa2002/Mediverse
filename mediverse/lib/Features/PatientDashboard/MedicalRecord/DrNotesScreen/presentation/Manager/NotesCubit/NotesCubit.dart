import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:mediverse/Constants/constant.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/DrNotesScreen/data/models/NoteModel.dart';
import 'package:mediverse/Features/PatientDashboard/MedicalRecord/DrNotesScreen/presentation/Manager/NotesCubit/NotesState.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;

  fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);

    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }
}
