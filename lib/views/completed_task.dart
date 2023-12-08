import 'package:flutter/material.dart';
import 'package:todo/components/app_bar.dart';
import 'package:todo/components/single_task.dart';
import 'package:todo/models/tasks.dart';

class CompletedTask extends StatefulWidget {
  const CompletedTask({super.key});

  @override
  State<CompletedTask> createState() => _CompletedTaskState();
}

class _CompletedTaskState extends State<CompletedTask> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(apptitle: "Completed",total: getCompletedTasks().length,),
        body: MySingleTask()
    );
  }
}
