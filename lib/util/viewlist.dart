import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/util/todo_tile.dart';
import '/provider/todothing_item.dart';

class ViewMyList extends StatelessWidget {
  const ViewMyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ToDoThing>(
      builder: (context, value, child) => ListView.builder(
        itemCount: value.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            task: value.toDoList[index],
          );
        },
      ),
    );
  }
}
