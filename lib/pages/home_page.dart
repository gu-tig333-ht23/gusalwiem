import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/pages/addtask_page.dart';
import '/util/filter.dart';
import '/util/viewlist.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            //filter knapp
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return MyFilter();
                      });
                },
                icon: const Icon(Icons.more_vert, color: Colors.white))
          ]),
      //gå till sida för att lägga till en ny task
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return AddTask();
            },
          ),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      //visa listan i homepage
      body: const ViewMyList(),
    );
  }
}
