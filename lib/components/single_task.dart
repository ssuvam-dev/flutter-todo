import 'package:flutter/material.dart';
import 'package:todo/components/emptylist.dart';
import 'package:todo/models/tasklist.dart';
import 'package:todo/models/tasks.dart';
import 'package:todo/utils/colors.dart';
import 'package:todo/views/edit_task.dart';

class MySingleTask extends StatefulWidget {
   MySingleTask({
    super.key,
    this.isCompletedTaskpage=false
   });
  bool isCompletedTaskpage;
  @override
  State<MySingleTask> createState() => _MySingleTaskState();
}

class _MySingleTaskState extends State<MySingleTask> {
 List<TaskList> highPriorityTasks = getHighPriorityTask();
  List<TaskList> mediumPriorityTasks = getMediumPriorityTask();
  List<TaskList> lowPriorityTasks = getLowPriorityTask();
  @override
  Widget build(BuildContext context) {

return SingleChildScrollView(
  child:   Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(highPriorityTasks.isNotEmpty)
            buildTaskList("High Priority (${highPriorityTasks.length})", highPriorityTasks,Color.fromARGB(255, 217, 101, 93)),
            if(mediumPriorityTasks.isNotEmpty)
            buildTaskList("Medium Priority (${mediumPriorityTasks.length})", mediumPriorityTasks, Colors.blue.shade400),
            if(lowPriorityTasks.isNotEmpty)
            buildTaskList("Low Priority (${lowPriorityTasks.length})", lowPriorityTasks,Colors.green.shade400),
            if (highPriorityTasks.isEmpty && mediumPriorityTasks.isEmpty && lowPriorityTasks.isEmpty)
              Container(
                
              child: EmptyList(isCompletedTaskpage: widget.isCompletedTaskpage,),
    ),
          ],
        ),
      ),
);
    // return Container(
    //   color: bgColor,
    //   child: Padding(
    //     padding: const EdgeInsets.only(top:10.0),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         SizedBox(height: 20,),
    //         Padding(
    //           padding: EdgeInsets.only(left: 20.0,bottom: 10.0),
    //           child: Text(
    //             "High Priority (${highPriorityTasks.length})",
    //             style: TextStyle(
    //               decoration: TextDecoration.underline,
    //               fontSize: 16.0,
    //               fontWeight: FontWeight.bold,
    //               color: themeColor
    //             ),
    //           ),
    //         ),
    //         Container(
    //           child: ListViewGenerator(highPriorityTasks),
    //         ),
            
      
    //         SizedBox(height: 20,),
    //         Padding(
    //           padding: EdgeInsets.only(left: 20.0),
    //           child: Text(
    //             "Medium Priority (${mediumPriorityTasks.length})",
    //             style: TextStyle(
    //               decoration: TextDecoration.underline,
    //               fontSize: 16.0,
    //               fontWeight: FontWeight.bold,
    //               color: themeColor
    //             ),
    //           ),
    //         ),
    //         Container(
    //           height: screenSize.height* 0.19,
    //           child: ListViewGenerator(mediumPriorityTasks),
    //         ),
      
    //         SizedBox(height: 20,),
    //         Padding(
    //           padding: EdgeInsets.only(left: 20.0),
    //           child: Text(
    //             "Low Priority (${lowPriorityTasks.length})",
    //             style: TextStyle(
    //               decoration: TextDecoration.underline,
    //               fontSize: 16.0,
    //               fontWeight: FontWeight.bold,
    //               color: themeColor
    //             ),
    //           ),
    //         ),
    //         Container(
    //           height: screenSize.height * 0.19,
    //           child: ListViewGenerator(lowPriorityTasks),
    //         )
    //       ],
    //     ),
    //   ),
    // );
    
  }
Widget buildTaskList(String title, List<TaskList> tasks,Color colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            title,
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: colors
            ),
          ),
        ),
        Container(
          child: ListViewGenerator(tasks),
        ),
      ],
    );
  }
  ListView ListViewGenerator(globalTasks) {
    return ListView.builder(
    shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    itemCount: globalTasks.length,
    itemBuilder: (BuildContext context, int index) {
      return buildTaskItem(index);
    }
    );
  }

   Widget buildTaskItem(int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(color: Color.fromRGBO(128, 129, 143, 0.9), blurRadius: 1, offset: Offset(0, 2)),
              ],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(
                    value: globalTasks[index].isCompleted ?? false,
                    onChanged: (bool? value) {
                      setState(() {
                        globalTasks[index].isCompleted = value;
                      });
                     
                    },
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      globalTasks[index].task ?? "",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
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
                                  taskname: globalTasks[index].task ?? "",
                                  taskdescription: globalTasks[index].description ?? "",
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
                            color: Color.fromARGB(255, 245, 125, 117),
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

