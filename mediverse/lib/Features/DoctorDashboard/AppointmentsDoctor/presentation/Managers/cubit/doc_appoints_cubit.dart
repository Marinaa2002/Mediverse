import 'package:bloc/bloc.dart';
import 'package:mediverse/AllModels/booking.dart';
import 'package:meta/meta.dart';

part 'doc_appoints_state.dart';

class DocAppointsCubit extends Cubit<DocAppointsState> {
  DocAppointsCubit() : super(DocAppointsInitial());
}
