import 'package:flutter/material.dart';
import 'package:template/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
            fontFamily: "Font 2",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }
}
