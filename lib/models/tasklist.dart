class TaskList {
  String? task;
  String? description;
  bool? isCompleted;
  String? priority;
  String? date;

  TaskList({
    required this.task,
    this.description="Default",
    this.isCompleted=false,
    required this.priority,
    required this.date
    });
}