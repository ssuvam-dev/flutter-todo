import 'package:get/get.dart';
import 'package:todo/models/tasklist.dart';
import 'package:intl/intl.dart';
import 'package:todo/models/tasks.dart';

class TaskController extends GetxController{
  
  // RxList<TaskList> globalTasks =[

  // ].obs;


   RxList<TaskList> globalTasks = RxList<TaskList>();
   RxList<TaskList> completedTasks = RxList<TaskList>();

  @override
  void onInit() {
    super.onInit();

    globalTasks.assignAll([
      TaskList(task: "High Priority Task",description: "test",isCompleted: false,priority: "High",date: DateFormat('yyyy-MM-dd').format(DateTime.now())),
      TaskList(task: "High Priority Task",description: "test",isCompleted: false,priority: "High",date: DateFormat('yyyy-MM-dd').format(DateTime.now())),
      TaskList(task: "High Priority Task",description: "test",isCompleted: false,priority: "High",date: DateFormat('yyyy-MM-dd').format(DateTime.now())),
      TaskList(task: "High Priority Task",description: "test",isCompleted: false,priority: "High",date: DateFormat('yyyy-MM-dd').format(DateTime.now())),
    TaskList(task: "Medium Priority Task",description: "test",isCompleted: false,priority: "Medium",date: DateFormat('yyyy-MM-dd').format(DateTime.now())),
     TaskList(task: "Medium Priority Task",description: "test",isCompleted: false,priority: "Medium",date: DateFormat('yyyy-MM-dd').format(DateTime.now())),
      TaskList(task: "Medium Priority Task",description: "test",isCompleted: false,priority: "Medium",date: DateFormat('yyyy-MM-dd').format(DateTime.now())),
  TaskList(task: "Medium Priority Task",description: "test",isCompleted: false,priority: "Medium",date: DateFormat('yyyy-MM-dd').format(DateTime.now())),
    TaskList(task: "Low Priority Task",description: "test",isCompleted: false,priority: "Low",date: DateFormat('yyyy-MM-dd').format(DateTime.now())),
  TaskList(task: "Low Priority Task",description: "test",isCompleted: false,priority: "Low",date: DateFormat('yyyy-MM-dd').format(DateTime.now()))
    ]);

    completedTasks.assignAll([
      TaskList(task: "High Priority Task",description: "test",isCompleted: true,priority: "High",date: DateFormat('yyyy-MM-dd').format(DateTime.now())),
      TaskList(task: "Medium Priority Task",description: "test",isCompleted: true,priority: "Medium",date: DateFormat('yyyy-MM-dd').format(DateTime.now())),
      TaskList(task: "Low Priority Task",description: "test",isCompleted: true,priority: "Low",date: DateFormat('yyyy-MM-dd').format(DateTime.now())),
    ]);

  }
  // RxList<TaskList> getCompletedTask()
  // {
  //   return globalTasks.where((task) => task.isCompleted == true).toList().obs;
  // }

  // RxList<TaskList> getTodoTask()
  // {
  //   return globalTasks.where((task) => task.isCompleted == false).toList().obs;
  // }

//   RxList<TaskList> getNotCompletedTasks() {
//   return globalTasks.where((task) => task.isCompleted == false).toList().obs;
// }

RxList<TaskList> getHighPriorityTask() {
  return globalTasks.where((task) => task.priority == "High").where((task) => task.isCompleted == false).toList().obs;
}

RxList<TaskList> getMediumPriorityTask() {
  return globalTasks.where((task) => task.priority == "Medium").where((task) => task.isCompleted == false).toList().obs;
}

RxList<TaskList> getLowPriorityTask() {
  return globalTasks.where((task) => task.priority == "Low").where((task) => task.isCompleted == false).toList().obs;
}

RxList<TaskList> getCompletedHighPriorityTask() {
  return completedTasks.where((task) => task.priority == "High").toList().obs;
}

RxList<TaskList> getCompletedMediumPriorityTask() {
  return completedTasks.where((task) => task.priority == "Medium").toList().obs;
}

RxList<TaskList> getCompletedLowPriorityTask() {
  return completedTasks.where((task) => task.priority == "Low").toList().obs;
}
void clearAll(bool isCompletedTaskPage)
{
  isCompletedTaskPage?completedTasks.clear():globalTasks.clear();
 
  update();
}

void delete(bool isCompletedTaskpage,TaskList task)
{
  if(isCompletedTaskpage)
  {
    completedTasks.remove(task);
  }
  else
  {
    globalTasks.remove(task);
  }
  update();
}

void updateValue(bool isCompletedTaskPage,TaskList task)
{
  if(isCompletedTaskPage)
  {
    globalTasks.add(task);
    completedTasks.remove(task);
    update();
  }
  else{
    completedTasks.add(task);
    globalTasks.remove(task);
    update();
  }
}

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
  globalTasks.add(task);
  update();
}

void updateTask(TaskList newtask,TaskList oldTask)
{

  int index=globalTasks.indexOf(oldTask);
  globalTasks[index]=newtask;
  update();
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
    double result = getResult();
   int res = (result*100).toInt();
  return "Efficiency ${res}%.";
}
  

}