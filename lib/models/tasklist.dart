class TaskList {
  String? task;
  String? description;
  bool? isCompleted;

  TaskList({
    required this.task,
    this.description="Default",
    this.isCompleted=false,
    });
}