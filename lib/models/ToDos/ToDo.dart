import 'dart:convert';
import 'package:http/http.dart' as http;

class ToDo {
  final int id;
  final String title;
  final bool completed;

  ToDo({
    required this.id,
    required this.title,
    required this.completed,
  });

  factory ToDo.fromJson(dynamic json) {
    return ToDo(
        id: json['id'], title: json['title'], completed: json['completed']);
  }

  static List<ToDo> toDosFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return ToDo.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'ToDo{id: $id, title: $title, completed: $completed}';
  }

//API
  static Future<List<ToDo>> getToDo() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((toDos) => ToDo.fromJson(toDos)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}
