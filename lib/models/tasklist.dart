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
 factory TaskList.fromJson(Map<String, dynamic> json)=>TaskList(
      task : json['task'],
      description : json['description'] ,
      isCompleted:json['isCompleted'],
      priority:json['priority'] ,
      date:json['date'] 
 );

  Map<String, dynamic> toJson() => {
        'task': task,
        'description': description,
        'isCompleted':isCompleted,
        'priority':priority,
        'date':date
      };
}