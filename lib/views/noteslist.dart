import 'package:api_using_flutter/models/ApiResponse.dart';
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
  ApiResponse<List<Notes>> _apiResponse;
  bool _isLoading = false;

  String formatDate(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  void initState() {
    _fetchNotes();
    super.initState();
  }

  _fetchNotes() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponse = await service.getNotesList();

    setState(() {
      _isLoading = false;
    });
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
        body: Builder(
          builder: (_) {
            if (_isLoading) {
              return CircularProgressIndicator();
            }

            if (_apiResponse.error) {
              return Center(
                child: Text(_apiResponse.errorMessage),
              );
            }
            return ListView.separated(
                itemBuilder: (_, index) {
                  return Dismissible(
                    key: ValueKey(_apiResponse.data[index].id),
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
                        _apiResponse.data[index].title,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      subtitle:
                          Text('Last edited on ${formatDate(_apiResponse.data[index].editeddateTime ?? _apiResponse.data[index].createdateTime)}'),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ModifyNotes(
                                  noteId: _apiResponse.data[index].id,
                                )));
                      },
                    ),
                  );
                },
                separatorBuilder: (_, __) => Divider(
                      height: 1,
                      color: Colors.green,
                    ),
                itemCount: _apiResponse.data.length);
          },
        ));
  }
}
