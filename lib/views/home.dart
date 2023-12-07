import 'package:flutter/material.dart';
import 'package:todo/components/app_bar.dart';
import 'package:todo/components/single_task.dart';
import 'package:todo/models/tasks.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: MyAppBar(apptitle: "TODO",total: getNotCompletedTasks().length,),
        body: MySingleTask(globalTasks: getNotCompletedTasks(),)
    );
  }
}