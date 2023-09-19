import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '/util/my_button.dart';
import '/provider/todothing_item.dart';

class AddTask extends StatelessWidget {
  AddTask({super.key});

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        //AppBar
        appBar: AppBar(
          //return button white
          iconTheme: IconThemeData(color: Colors.white),
          //designAppBar
          systemOverlayStyle: SystemUiOverlayStyle.light,
          title: const Text(
            "ADD NEW TASK",
            style: TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 25.0,
            right: 25.0,
            top: 25.0,
            bottom: 500,
          ),

          // White box
          child: Container(
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),

            // Input
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'What are you going to do?',
                  ),
                ),

                // Add button
                Consumer(
                  builder: (context, value, child) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: MyButton(
                        text: "ADD TASK",
                        onPressed: () {
                          String enteredText = _controller.text;
                          Provider.of<ToDoThing>(context, listen: false)
                              .saveNewTask(enteredText);
                          _controller.clear();
                          Navigator.of(context).pop();
                        }),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
