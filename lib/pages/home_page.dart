import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:template/pages/addtask_page.dart';
import 'package:template/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //text controller
  final _controller = TextEditingController();

  //list of todo tasks
  List toDoList = [
    ["Make Tutorial", false],
    ["Do Exercise", false],
  ];

  //checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  //save new task
  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
  }

  /*//create new task
  void createNewTask() {
    //kanske användbar kod senare??
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }*/

  //navigate to next screen
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => addTask(
              onSave: () {},
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle.light,
            title: const Text(
              'TO DO',
              style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
                color: Colors.white,
              ),
            ),
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildPopupDialog(context),
                    );
                  },
                  icon: Icon(Icons.more_vert, color: Colors.white))
            ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _navigateToNextScreen(context);
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
            );
          },
        ));
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return AlertDialog(
    title: const Text('Filter'),
    content: const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("All"),
        Text("Done"),
        Text("Undone"),
      ],
    ),
    actions: <Widget>[
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Apply'),
      ),
    ],
  );
}
