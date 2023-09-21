import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/util/api.dart';
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
            //FILTER BUTTON
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const MyFilter();
                      });
                },
                icon: const Icon(Icons.more_vert, color: Colors.white))
          ]),

      //GO TO ADD NEW TASK PAGE
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

      //SHOW LIST IN HOMEPAGE
      body: FutureBuilder(
        future: API.getList(),
        builder: ((context, snapshot) {
          //SHOW DATA
          if (snapshot.connectionState == ConnectionState.done) {
            return const ViewMyList();
          }
          //LOADING SCREEN
          else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
