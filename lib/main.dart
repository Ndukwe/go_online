import 'package:go_online/go_online.dart';
import 'package:intl/intl.dart';
import 'note.dart';

class NoteService {
  final goOnline = GoOnline();
  final baseURL = 'yourBaseURL';

  Future<List> getNotes() async {
    goOnline.baseurl = baseURL;
    var fetch = await goOnline.getData('/notes');
    List<dynamic> data = fetch.body;
    return  data.map((e) => Note.fromJson(e)).toList();

  }

  Future<Note> getNoteById(int id) async {
    goOnline.baseurl = baseURL;
    var fetch = await goOnline.getData('/notes/$id');
    dynamic data = fetch.body;
    return data;
  }

  Future<Note> createNote(String title, String content) async {
    goOnline.baseurl = baseURL;
    var now = DateTime.now();
    var data = {
      'title': title,
      'content': content,
      'createdAt': DateFormat('yyyy-MM-ddTHH:mm:ss').format(now),
      'updatedAt': DateFormat('yyyy-MM-ddTHH:mm:ss').format(now),
    };
    var response = await goOnline.postData(data, '/notes');
    dynamic responseData = response.body;
    return responseData ;
  }

  Future<Note> updateNote(
      int id, String title, String content, DateTime updatedAt) async {
    goOnline.baseurl = baseURL;
    var data = {
      'title': title,
      'content': content,
      'updatedAt': DateFormat('yyyy-MM-ddTHH:mm:ss').format(updatedAt),
    };
    var response = await goOnline.updateData(data, '/notes/$id');
    dynamic responseData = response.body;
    return responseData ;
  }

  Future<bool> deleteNote(int id) async {
    goOnline.baseurl = baseURL;
    var response = await goOnline.deleteData('/notes/$id');
    print(response.body) ;
    return response.body;
  }


}
