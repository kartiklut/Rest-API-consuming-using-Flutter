import 'package:flutter/material.dart';

class ModifyNotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modify List'),
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
              child: Text('Add Notes'),
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
