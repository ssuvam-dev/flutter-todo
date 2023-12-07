import 'package:todo/models/tasklist.dart';

List<TaskList> globalTasks = [
  TaskList(task: "Task 1",description: "test",isCompleted: true),
  TaskList(task: "Task 2",description: "test",isCompleted: false)
];

List<TaskList> getCompletedTasks() {
  var result = globalTasks.where((task) => task.isCompleted == true).toList();
  return result;
}

List<TaskList> getNotCompletedTasks() {
  return globalTasks.where((task) => task.isCompleted == false).toList();
}