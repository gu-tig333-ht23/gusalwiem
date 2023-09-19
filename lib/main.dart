import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/provider/todothing_item.dart';
import 'pages/home_page.dart';

void main() {
  ToDoThing state = ToDoThing();
  runApp(ChangeNotifierProvider(
    create: (context) => state,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
            fontFamily: 'Raleway',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }
}
