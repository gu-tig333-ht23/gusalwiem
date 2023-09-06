import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class addTask extends StatelessWidget {
  VoidCallback onSave;
  addTask({
    super.key,
    required this.onSave,
  });

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
      body: const NewTask(),
    );
  }
}

class NewTask extends StatefulWidget {
  const NewTask({super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                decoration: const InputDecoration(
                  hintText: 'What are you going to do?',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),

              // Add button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  child: const Text(
                    'Save Task',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.

                    if (_formKey.currentState!.validate()) {
                      // Process data.
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
