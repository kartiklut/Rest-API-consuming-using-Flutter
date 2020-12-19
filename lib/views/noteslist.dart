import 'package:api_using_flutter/models/Notes.dart';
import 'package:flutter/material.dart';

class NotesList extends StatelessWidget {
  final notes = [new Notes(title: "Note1", createdateTime: DateTime.now(), editeddateTime: DateTime.now())];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List of Notes'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        body: ListView.separated(
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(
                  'Hello',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                subtitle: Text('Last edited on'),
              );
            },
            separatorBuilder: (_, __) => Divider(
                  height: 1,
                  color: Colors.green,
                ),
            itemCount: 30));
  }
}
