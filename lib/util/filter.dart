import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/util/my_button.dart';
import '/provider/todothing_item.dart';

class MyFilter extends StatelessWidget {
  const MyFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Filter'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //FILTER ALL
          MyButton(
              text: "ALL",
              onPressed: () {
                context.read<ToDoThing>().setFilter('all');
                Navigator.of(context).pop();
              }),
          const SizedBox(height: 4),

          //FILTER DONE
          MyButton(
              text: "DONE",
              onPressed: () {
                context.read<ToDoThing>().setFilter('done');
                Navigator.of(context).pop();
              }),
          const SizedBox(height: 4),

          //FILTER UNDONE
          MyButton(
              text: "UNDONE",
              onPressed: () {
                context.read<ToDoThing>().setFilter('undone');
                Navigator.of(context).pop();
              }),
          const SizedBox(height: 4),
        ],
      ),
      //CANCEL BUTTON
      actions: <Widget>[
        const SizedBox(height: 12),
        MyButton(
          text: "Cancel",
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
