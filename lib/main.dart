import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nested/nested.dart';
import 'package:yaoumi/core/router/app_routes.dart';
import 'package:yaoumi/features/notes/data/models/note_hive_adapter.dart';
import 'package:yaoumi/features/notes/presentation/bloc/notes/notes_bloc.dart';
import 'package:yaoumi/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <SingleChildWidget>[
        BlocProvider<NotesBloc>(
            create: (_) => di.sl<NotesBloc>()..add(GetAllNotes())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true,
        ),
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: AppRoutes.home,
      ),
    );
  }
}
