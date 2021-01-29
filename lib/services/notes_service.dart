import 'dart:convert';

import 'package:api_using_flutter/models/ApiResponse.dart';

import '../models/Notes.dart';
import 'package:http/http.dart' as http;

class NotesService {
  static const API = "https://tq-notes-api-jkrgrdggbq-el.a.run.app";
  static const headers = {'apiKey': '09a14e67-df20-49ed-9932-73f56cab22a9'};

  Future<ApiResponse<List<Notes>>> getNotesList() {
    return http.get(API + '/notes', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <Notes>[];
        for (var item in jsonData) {
          final note = Notes(
            id: item['noteID'],
            title: item['noteTitle'],
            createdateTime: DateTime.parse(item['createDateTime']),
            editeddateTime: item['latestEditDateTime'] != null ? DateTime.parse(item['latestEditDateTime']) : null,
          );
          notes.add(note);
        }
        return ApiResponse<List<Notes>>(data: notes);
      }
      return ApiResponse<List<Notes>>(error: true, errorMessage: "An Error Occured!!!");
    }).catchError((_) => ApiResponse<List<Notes>>(error: true, errorMessage: "An Error Occureddddd!!!"));
  }
}
