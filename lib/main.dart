import 'package:flutter/material.dart';
import 'package:todo/components/bottom_navigation.dart';
import 'package:todo/views/create_task.dart';
import 'package:todo/views/edit_task.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: MyBottomNavBar(),
    routes: {
      '/create_task':(context) => CreateTask(),
      '/edit_task':(context) => EditTodo(),
    },
    debugShowCheckedModeBanner: false,
    );
  }
}
