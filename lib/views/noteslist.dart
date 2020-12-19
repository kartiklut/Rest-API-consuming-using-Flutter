import 'package:api_using_flutter/models/Notes.dart';
import 'package:api_using_flutter/views/modifynotes.dart';
import 'package:flutter/material.dart';

class NotesList extends StatelessWidget {
  final notes = [
    new Notes(title: "Note1", createdateTime: DateTime.now(), editeddateTime: DateTime.now()),
    new Notes(title: "Note1", createdateTime: DateTime.now(), editeddateTime: DateTime.now()),
    new Notes(title: "Note1", createdateTime: DateTime.now(), editeddateTime: DateTime.now())
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
              return ListTile(
                title: Text(
                  notes[index].title,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                subtitle: Text('Last edited on ${formatDate(notes[index].editeddateTime)}'),
              );
            },
            separatorBuilder: (_, __) => Divider(
                  height: 1,
                  color: Colors.green,
                ),
            itemCount: notes.length));
  }
}
