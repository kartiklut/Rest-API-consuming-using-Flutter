import 'package:flutter/material.dart';

class ModifyNotes extends StatelessWidget {

  final String noteId;
  ModifyNotes({this.noteId});

  bool get isEditing=>(noteId!=null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Modify Note' : 'Create Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter title',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                hintText: "Enter title",
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter content',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                hintText: "Enter content",
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              color: Colors.lightBlue,
              onPressed: () => {},
              child: Text(isEditing ? 'Edit Note' :'Add Notes'),
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
