import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

final idServiceLocator = GetIt.instance;


void setupIDServiceLocator() {
  idServiceLocator.registerLazySingleton<Uuid>(() => const Uuid());
}
