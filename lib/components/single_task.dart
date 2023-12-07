import 'package:flutter/material.dart';
import 'package:todo/models/tasklist.dart';
import 'package:todo/models/tasks.dart';
import 'package:todo/utils/colors.dart';
import 'package:todo/views/edit_task.dart';

class MySingleTask extends StatefulWidget {
  final List<TaskList> globalTasks;
   MySingleTask({
    super.key,
    required this.globalTasks,
   });

  @override
  State<MySingleTask> createState() => _MySingleTaskState();
}

class _MySingleTaskState extends State<MySingleTask> {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: ListView.builder(
      itemCount: widget.globalTasks.length,
      itemBuilder: (BuildContext context, int index) {
        return buildTaskItem(index);
      }
      ),
    );
    
  }

   Widget buildTaskItem(int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 20, 8, 0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(color: Color.fromRGBO(128, 129, 143, 0.9), blurRadius: 3, offset: Offset(0, 4)),
              ],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(
                    value: widget.globalTasks[index].isCompleted ?? false,
                    onChanged: (bool? value) {
                      setState(() {
                        widget.globalTasks[index].isCompleted = value;
                      });
                     
                    },
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      widget.globalTasks[index].task ?? "",
                      style: const TextStyle(
                        fontSize: 18,
                        color: themeColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditTodo(
                                  taskname: widget.globalTasks[index].task ?? "",
                                  taskdescription: widget.globalTasks[index].description ?? "",
                                ),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: iconColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              globalTasks.removeAt(index);
                            });
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: iconColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}

