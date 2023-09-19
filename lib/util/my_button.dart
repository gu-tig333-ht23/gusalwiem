import 'package:flutter/material.dart';

//GENERAL BUTTON LOOK USED IN OTHER CLASSES

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    //required String value,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.blue[300],
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
