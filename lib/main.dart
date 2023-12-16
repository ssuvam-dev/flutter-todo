import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/components/bottom_navigation.dart';
import 'package:todo/screens/splash.dart';
import 'package:todo/views/create_task.dart';
import 'package:get/get.dart';
import 'package:todo/views/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override

  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool? openSplashScreen;
  void loadSharedPreferences()async
  {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    openSplashScreen=sharedPreferences.getBool('openSplashScreen');
    if (openSplashScreen == null) {
      sharedPreferences.setBool('openSplashScreen', true);
      openSplashScreen = true;
    }
  }

  @override
  initState() {
    super.initState();
    loadSharedPreferences();
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp
    (
    home:openSplashScreen==true?SplashScreen():MyBottomNavBar(),
    // home: MyBottomNavBar(),
    routes: {
      '/create_task':(context) => CreateTask(),
    },
    debugShowCheckedModeBanner: false,
    );
  }
}
