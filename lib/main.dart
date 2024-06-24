import 'package:flutter/material.dart';
import 'package:homework_2/animate_container.dart';
import 'package:homework_2/switch_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimateContainer(),
    );
  }
}
