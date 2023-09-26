import 'package:flutter/material.dart';
import '/util/api.dart';

class Task {
  final String tName;
  bool boxCheck;
  final String? id;

  Task(
    this.tName, {
    this.boxCheck = false,
    this.id,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(json['title'], boxCheck: json['done'], id: json['id']);
  }

  Map<String, dynamic> toJson() {
    return {"title": tName, 'done': boxCheck};
  }
}

class ToDoThing extends ChangeNotifier {
//OUR LIST
  List<Task> _toDoList = [];

//GET LIST FROM API
  void fetchList() async {
    var toDoList = await API.getList();
    _toDoList = toDoList;
    notifyListeners();
  }

  API apiMethods = API();

//CHANGE CHECKBOX
  void checkBoxChanged(task) async {
    Task onChange = task;
    onChange.boxCheck = !onChange.boxCheck;
    await apiMethods.updateTask(task);
    fetchList();
  }

//SAVE TASK
  void saveNewTask(task) async {
    Task newTask = Task(task);
    await apiMethods.addTask(newTask);
    fetchList();
  }

//DELETE TASK
  void deleteTask(task) async {
    await apiMethods.removeTask(task);
    fetchList();
  }

//FILTER
  String selectedFilter = '';

  String setFilter(String filt) {
    selectedFilter = filt;
    notifyListeners();
    return selectedFilter;
  }

  List<Task> get toDoList {
    switch (selectedFilter) {
      case 'all':
        return _toDoList.toList();
      case 'done':
        return _toDoList.where((element) => element.boxCheck == true).toList();
      case 'undone':
        return _toDoList.where((element) => element.boxCheck == false).toList();
      default:
        return _toDoList.toList();
    }
  }
}
