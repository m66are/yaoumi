import 'package:flutter/material.dart';
import 'package:yaoumi/features/notes/presentation/views/note_list_view.dart';

class AppRoutes {
  static const String home = '/';
  static const String singleNote = '/note';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const NoteListView());
      // case AppRoutes.detail:
      //   if (settings.arguments is RouteArguments) {
      //     final arguments = settings.arguments as RouteArguments;
      //     return MaterialPageRoute(
      //       builder: (_) => DetailScreen(arguments: arguments),
      //     );
      //   }
      // return _errorRoute();
      default:
        // Handle the case where the route name is not recognized
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: const Center(child: Text('Error: Unknown route')),
          ),
        );
    }
  }
}
