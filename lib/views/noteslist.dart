import 'package:api_using_flutter/models/Notes.dart';
import 'package:api_using_flutter/views/deletenotealert.dart';
import 'package:api_using_flutter/views/modifynotes.dart';
import 'package:flutter/material.dart';

class NotesList extends StatelessWidget {
  final notes = [
    new Notes(id: 'a', title: "Note1", createdateTime: DateTime.now(), editeddateTime: DateTime.now()),
    new Notes(id: 'a', title: "Note1", createdateTime: DateTime.now(), editeddateTime: DateTime.now()),
    new Notes(id: 'a', title: "Note1", createdateTime: DateTime.now(), editeddateTime: DateTime.now())
  ];

  String formatDate(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
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
