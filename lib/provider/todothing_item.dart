import 'package:flutter/material.dart';

class Task {
  String tName;
  bool boxCheck;

  Task({
    required this.tName,
    required this.boxCheck,
  });
}

class ToDoThing extends ChangeNotifier {
//vår lista
// ignore: prefer_final_fields
  List<Task> _toDoList = [
    Task(tName: 'fixa filterjäveln', boxCheck: false),
  ];

//change checkbox
  void checkBoxChanged(task) {
    task.boxCheck = !task.boxCheck;
    //_toDoList[index][1] = !_toDoList[index][1];
    notifyListeners();
  }

//save task
  void saveNewTask(String eText) {
    _toDoList.add(Task(tName: eText, boxCheck: false));
    notifyListeners();
  }

//delete task
  void deleteTask(task) {
    _toDoList.remove(task);
    notifyListeners();
  }

//filter
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
