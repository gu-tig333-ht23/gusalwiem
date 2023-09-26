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
    //MESSAGE FOR ADD BUTTON
    void snackis(String text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.blue,
          content: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }

    return Scaffold(
        backgroundColor: Colors.blue[100],
        //APPBAR
        appBar: AppBar(
          //RETURN BUTTON WHITE
          iconTheme: IconThemeData(color: Colors.white),
          //DESIGN OF APPBAR
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

        //BODY
        body: Padding(
          padding: const EdgeInsets.only(
            left: 25.0,
            right: 25.0,
            top: 25.0,
            bottom: 500,
          ),

          // WHITE BOX
          child: Container(
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),

            // INPUT FIELD
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'What are you going to do?',
                    icon: Icon(Icons.check),
                  ),
                ),

                // ADD BUTTON
                Consumer(
                  builder: (context, value, child) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: MyButton(
                        text: "ADD TASK",
                        onPressed: () {
                          String enteredText = _controller.text;
                          if (enteredText == '') {
                            snackis('Textfield empty! Please enter som text.');
                          } else {
                            Provider.of<ToDoThing>(context, listen: false)
                                .saveNewTask(enteredText);
                            _controller.clear();
                            snackis('Task added!');
                            Navigator.of(context).pop();
                          }
                        }),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
