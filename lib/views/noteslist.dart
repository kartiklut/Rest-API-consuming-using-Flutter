import 'package:api_using_flutter/models/Notes.dart';
import 'package:get_it/get_it.dart';

import '../services/notes_service.dart';
import '../views/deletenotealert.dart';
import '../views/modifynotes.dart';
import 'package:flutter/material.dart';

class NotesList extends StatefulWidget {
  @override
  _NotesListState createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  NotesService get service => GetIt.I<NotesService>();

  List<Notes> notes=[];

  String formatDate(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  void initState() {
    notes=service.getNotesList();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List of Notes'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => ModifyNotes()));
          },
          child: Icon(Icons.add),
        ),
        body: ListView.separated(
            itemBuilder: (_, index) {
              return Dismissible(
                key: ValueKey(notes[index].id),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  padding: EdgeInsets.only(left: 16),
                  child: Align(
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    alignment: Alignment.centerRight,
                  ),
                ),
                onDismissed: (direction) {},
                confirmDismiss: (direction) async {
                  final result = await showDialog(context: context, builder: (_) => DeleteNoteAlert());
                  return result;
                },
                child: ListTile(
                  title: Text(
                    notes[index].title,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  subtitle: Text('Last edited on ${formatDate(notes[index].editeddateTime)}'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ModifyNotes(
                              noteId: notes[index].id,
                            )));
                  },
                ),
              );
            },
            separatorBuilder: (_, __) => Divider(
                  height: 1,
                  color: Colors.green,
                ),
            itemCount: notes.length));
  }
}
