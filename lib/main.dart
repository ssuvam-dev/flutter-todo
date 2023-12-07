import 'package:flutter/material.dart';
import 'package:todo/screens/splash.dart';
import 'package:todo/views/create_task.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: SplashScreen(),
    routes: {
      '/create_task':(context) => CreateTask(),
    },
    debugShowCheckedModeBanner: false,
    );
  }
}
