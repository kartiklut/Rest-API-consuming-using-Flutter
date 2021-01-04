import 'package:api_using_flutter/services/notes_service.dart';
import 'package:get_it/get_it.dart';

import './views/noteslist.dart';
import 'package:flutter/material.dart';

void setupLocator()
{
  GetIt.I.registerLazySingleton(() => NotesService());
}

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NotesList(),
    );
  }
}
