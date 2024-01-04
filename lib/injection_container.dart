import 'package:get_it/get_it.dart';
import 'package:yaoumi/features/notes/data/repositories/note_repository_impl.dart';
import 'package:yaoumi/features/notes/data/sources/local/local_note_datasource.dart';
import 'package:yaoumi/features/notes/data/sources/note_db.dart';
import 'package:yaoumi/features/notes/domain/repositories/note_repository.dart';
import 'package:yaoumi/features/notes/domain/usecases/add_note_usecase.dart';
import 'package:yaoumi/features/notes/domain/usecases/get_notes_usecase.dart';
import 'package:yaoumi/features/notes/presentation/bloc/notes/notes_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // notes //

  // blocs //
  sl.registerFactory<NotesBloc>(() => NotesBloc(
      getNotesUseCase: sl<GetNotesUseCase>(),
      addNoteUseCase: sl<AddNoteUseCase>()));

  // usecases //
  sl.registerLazySingleton<GetNotesUseCase>(
      () => GetNotesUseCase(sl<NoteRepository>()));
  sl.registerLazySingleton<AddNoteUseCase>(
      () => AddNoteUseCase(sl<NoteRepository>()));

  // repos //

  sl.registerLazySingleton<NoteRepository>(
      () => NoteRepositoryImpl(noteDataSource: sl<NoteDataSource>()));

  // datasources //

  sl.registerLazySingleton<NoteDataSource>(() => LocalNoteDataSource());

  // external //
}
