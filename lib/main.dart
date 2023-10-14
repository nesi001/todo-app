import 'package:flutter/material.dart';
import 'package:my_todo/Todo_screen.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  debugShowCheckedModeBanner: false,
  home: const Todo(),
  theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}