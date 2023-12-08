import 'package:intl/intl.dart';
import 'package:todo/models/tasklist.dart';

List<TaskList> globalTasks = [
  TaskList(task: "High Priority Task",description: "test",isCompleted: true,priority: "High",date: DateFormat('yyyy-MM-dd').format(DateTime.now())),
  TaskList(task: "High Priority Task",description: "test",isCompleted: false,priority: "High",date: DateFormat('yyyy-MM-dd').format(DateTime.now())),
      TaskList(task: "High Priority Task",description: "test",isCompleted: false,priority: "High",date: DateFormat('yyyy-MM-dd').format(DateTime.now())),

    TaskList(task: "Medium Priority Task",description: "test",isCompleted: true,priority: "Medium",date: DateFormat('yyyy-MM-dd').format(DateTime.now())),
  TaskList(task: "Medium Priority Task",description: "test",isCompleted: false,priority: "Medium",date: DateFormat('yyyy-MM-dd').format(DateTime.now())),
      TaskList(task: "Medium Priority Task",description: "test",isCompleted: false,priority: "Medium",date: DateFormat('yyyy-MM-dd').format(DateTime.now())),
  TaskList(task: "Medium Priority Task",description: "test",isCompleted: false,priority: "Medium",date: DateFormat('yyyy-MM-dd').format(DateTime.now())),

    TaskList(task: "Low Priority Task",description: "test",isCompleted: true,priority: "Low",date: DateFormat('yyyy-MM-dd').format(DateTime.now())),
  TaskList(task: "Low Priority Task",description: "test",isCompleted: false,priority: "Low",date: DateFormat('yyyy-MM-dd').format(DateTime.now()))
];

List<TaskList> getCompletedTasks() {
  var result = globalTasks.where((task) => task.isCompleted == true).toList();
  return result;
}

List<TaskList> getNotCompletedTasks() {
  return globalTasks.where((task) => task.isCompleted == false).toList();
}

List<TaskList> getHighPriorityTask() {
  return globalTasks.where((task) => task.priority == "High").toList();
}

List<TaskList> getMediumPriorityTask() {
  return globalTasks.where((task) => task.priority == "Medium").toList();
}

List<TaskList> getLowPriorityTask() {
  return globalTasks.where((task) => task.priority == "Low").toList();
}