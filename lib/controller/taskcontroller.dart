import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:todo/models/tasklist.dart';
import 'package:shared_preferences/shared_preferences.dart';
class TaskController extends GetxController{
   late SharedPreferences sharedPreferences;
   List<TaskList> allTask = List.empty(growable: true);
   List<TaskList> completedTasks=List.empty(growable: true);
   List<TaskList> globalTasks=List.empty(growable: true);

  void loadSharedPreferences()async
  {
    sharedPreferences = await SharedPreferences.getInstance();
    updateSharedPreferences();
  }

  void updateSharedPreferences()
  {
       List<String>? data =sharedPreferences.getStringList('todoTask');
  
    if(data!=null)
    {
      allTask = data.map((task) => TaskList.fromJson(json.decode(task))).toList();
    }
    
    globalTasks =allTask.where((element) => element.isCompleted == false).toList();
    completedTasks = allTask.where((element) => element.isCompleted == true).toList();
    update();
  }

  @override
  void onInit() {
    loadSharedPreferences();
    super.onInit();
  }


  // List<TaskList> getCompletedTask()
  // {
  //   return globalTasks.where((task) => task.isCompleted==true).toList();
  // }

  // List<TaskList> getTodoTask(){
  //   return globalTasks.where((task) => task.isCompleted==false).toList();
  // }

  List<TaskList> getNotCompletedTasks() {
    return [

    ];
 }

  List<TaskList> getHighPriorityTask() {
    return globalTasks.where((task) => task.priority== "High").toList();
    
  }

  List<TaskList> getMediumPriorityTask() {
    return globalTasks.where((task) => task.priority== "Medium").toList();
  }

  List<TaskList> getLowPriorityTask() {
  return globalTasks.where((task) => task.priority== "Low").toList();
  }

  List<TaskList> getCompletedHighPriorityTask() {
    return completedTasks.where((task) => task.priority== "High").toList();
  }

  List<TaskList> getCompletedMediumPriorityTask() {
      return completedTasks.where((task) => task.priority== "Medium").toList();
  }

  List<TaskList> getCompletedLowPriorityTask() {
    return completedTasks.where((task) => task.priority== "Low").toList();
  }

  void updateSharedPreferencesData()
  {
    List<String> mylist=allTask.map((task) =>jsonEncode(task.toJson()) ).toList();
    sharedPreferences.setStringList('todoTask',mylist);
    updateSharedPreferences();
  }
  void updateTaskStatus(bool? value,bool isCompleteTaskPage,TaskList task)
  {
    task.isCompleted=value;
    updateSharedPreferencesData();
  }

  void clearAll(bool isCompletedTaskPage)
  {
    if(isCompletedTaskPage)
    {
      for (var task in completedTasks) {
        allTask.remove(task);
      }
    }
    else
    {
      for (var task in globalTasks) {
        allTask.remove(task);
      }
    }
    
    updateSharedPreferencesData();
  } 

  void delete(bool isCompletedTaskpage,TaskList task)
  {
    allTask.remove(task);
    updateSharedPreferencesData();
  }

  // void updateValue(bool isCompletedTaskPage,TaskList task)
  // {
  //   if(isCompletedTaskPage)
  //   {
  //     print("i");
  //   }
  //   else{
  //     print("o");
  //   }
  // }

  String getAppBarTitle(bool isCompletedTaskPage,bool isFixedTitle,String message)
  {
    if(isCompletedTaskPage)
    {
      return "Completed Task ${completedTasks.length>0?'(${completedTasks.length})':''}";
    }
    else if(isFixedTitle)
    {
      return message;
    }
    else{
      return "TODO ${globalTasks.length>0?'(${globalTasks.length})':''}";
    }
    
  }

  void addNewTask(TaskList task)
  {
    allTask.add(task);
    List<String> mylist=allTask.map((task) =>jsonEncode(task.toJson()) ).toList();
    sharedPreferences.setStringList('todoTask',mylist);
    updateSharedPreferences();
  }

  void updateTask(TaskList newtask,TaskList oldTask)
  {

    int index=allTask.indexOf(oldTask);
    allTask[index]=newtask;
    updateSharedPreferencesData();
  }

  double getResult()
  {

    int total_tasks=completedTasks.length + globalTasks.length;
    if(total_tasks ==0)
    {
      return 0.0;
    }
    else{
        return completedTasks.length/total_tasks;
    }

  }

  String getResultMessage()
  {
    if(allTask.isNotEmpty)
    {
      double result = getResult();
      int res = (result*100).toInt();
      return "Efficiency ${res}%.";
    }

    else
    {
      return "Not Enough Data";
    }
  }

  String getCenterText()
  {
    return allTask.isEmpty ? "Not Enough Data" : "";
  }

    

    

  }