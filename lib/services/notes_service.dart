import '../models/Notes.dart';

class NotesService {
  List<Notes> getNotesList() {
    return [
      new Notes(id: 'a', title: "Note1", createdateTime: DateTime.now(), editeddateTime: DateTime.now()),
      new Notes(id: 'a', title: "Note1", createdateTime: DateTime.now(), editeddateTime: DateTime.now()),
      new Notes(id: 'a', title: "Note1", createdateTime: DateTime.now(), editeddateTime: DateTime.now())
    ];
  }
}
