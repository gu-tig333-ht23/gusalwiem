import 'dart:convert';
import 'package:http/http.dart' as http;
import '../provider/todothing_item.dart';

// ignore: constant_identifier_names
const String ENDPOINT = 'https://todoapp-api.apps.k8s.gu.se';
const String myKey = '3488fbe4-1d0b-40c3-9ce1-83af0648185c';

class API {
//GET LIST
  static Future<List<Task>> getList() async {
    Uri url = Uri.parse('$ENDPOINT/todos?key=$myKey');

    http.Response response = await http.get(url);
    String body = response.body;

    List<dynamic> jsonResponse = jsonDecode(body);
    List<Task> toDoList =
        jsonResponse.map((json) => Task.fromJson(json)).toList();

    return toDoList;
  }

//ADD TASK
  Future addTask(Task task) async {
    await http.post(
      Uri.parse('$ENDPOINT/todos?key=$myKey'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(task.toJson()),
    );
  }

//REMOVE TASK
  Future removeTask(task) async {
    var id = task.id;
    await http.delete(Uri.parse('$ENDPOINT/todos/$id?key=$myKey'));
  }

//CHECKBOX UPDATED
  Future updateTask(Task task) async {
    var id = task.id;
    await http.put(Uri.parse('$ENDPOINT/todos/$id?key=$myKey'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(task.toJson()));
  }
}
