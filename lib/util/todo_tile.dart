import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/todothing_item.dart';

class ToDoTile extends StatelessWidget {
  final Task task;

  const ToDoTile({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, top: 25.0, right: 25.0),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.blue[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            //CHECKBOX
            GestureDetector(
              onTap: () {
                context.read<ToDoThing>().checkBoxChanged(task);
              },
              child: !task.boxCheck // CHECKBOX DESIGN
                  ? const Icon(
                      Icons.check_box_outline_blank,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.check_box,
                      color: Colors.white,
                    ),
            ),
            // TASK NAME
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  task.tName,
                  style: TextStyle(
                    color: task.boxCheck ? Colors.blue : Colors.white,
                    decoration: task.boxCheck
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
            ),

            //DELETE BUTTON
            IconButton(
              onPressed: () {
                context.read<ToDoThing>().deleteTask(task);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
