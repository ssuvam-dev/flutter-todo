import 'package:flutter/material.dart';
import 'package:todo/components/emptylist.dart';
import 'package:todo/controller/taskcontroller.dart';
import 'package:todo/models/tasklist.dart';
import 'package:todo/utils/colors.dart';
import 'package:todo/views/edit_task.dart';
import 'package:get/get.dart';

class MySingleTask extends StatefulWidget {
   MySingleTask({
    super.key,
    this.isCompletedTaskpage=false
   });
  bool isCompletedTaskpage;
  bool showPopup =false;
  @override
  State<MySingleTask> createState() => _MySingleTaskState();
}

class _MySingleTaskState extends State<MySingleTask> {
    TaskController _controller =Get.put(TaskController());
 
  @override
  Widget build(BuildContext context) {
List<TaskList> highPriorityTasks = _controller.getHighPriorityTask();
  List<TaskList> mediumPriorityTasks = _controller.getMediumPriorityTask();
  List<TaskList> lowPriorityTasks = _controller.getLowPriorityTask();
  
return SingleChildScrollView(
  child:   GetBuilder<TaskController>(
    builder: (_) {
      return Container(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (!widget.isCompletedTaskpage) ...[
        if (_controller.getHighPriorityTask().isNotEmpty)
          buildTaskList("High Priority (${_controller.getHighPriorityTask().length})", _controller.getHighPriorityTask(), Color.fromARGB(255, 217, 101, 93)),
        if (_controller.getMediumPriorityTask().isNotEmpty)
          buildTaskList("Medium Priority (${_controller.getMediumPriorityTask().length})", _controller.getMediumPriorityTask(), Colors.blue.shade400),
        if (_controller.getLowPriorityTask().isNotEmpty)
          buildTaskList("Low Priority (${_controller.getLowPriorityTask().length})", _controller.getLowPriorityTask(), Colors.green.shade400),
      ] else ...[
        if (_controller.getCompletedHighPriorityTask().isNotEmpty)
          buildTaskList("High Priority (${_controller.getCompletedHighPriorityTask().length})", _controller.getCompletedHighPriorityTask(), Color.fromARGB(255, 217, 101, 93)),
        if (_controller.getCompletedMediumPriorityTask().isNotEmpty)
          buildTaskList("Medium Priority (${_controller.getCompletedMediumPriorityTask().length})", _controller.getCompletedMediumPriorityTask(), Colors.blue.shade400),
        if (_controller.getCompletedLowPriorityTask().isNotEmpty)
          buildTaskList("Low Priority (${_controller.getCompletedLowPriorityTask().length})", _controller.getCompletedLowPriorityTask(), Colors.green.shade400),
      ],
      if ((widget.isCompletedTaskpage &&
              _controller.getCompletedHighPriorityTask().isEmpty &&
              _controller.getCompletedMediumPriorityTask().isEmpty &&
              _controller.getCompletedLowPriorityTask().isEmpty) ||
          (!widget.isCompletedTaskpage && _controller.getHighPriorityTask().isEmpty && _controller.getMediumPriorityTask().isEmpty && _controller.getLowPriorityTask().isEmpty))
        EmptyList(isCompletedTaskpage: widget.isCompletedTaskpage),
    ],
  ),
);

    }
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
    return Builder(
      builder: (context) {
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
    );
  }
  ListView ListViewGenerator(globalTasks) {
    return ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: globalTasks.length,
    itemBuilder: (BuildContext context, int index) {
      return buildTaskItem(index,globalTasks);
    }
    );
  }

   Widget buildTaskItem(int index,List<TaskList>globalTasks) {
    return GetBuilder<TaskController>(
      builder: (_) {
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
                          
                           _controller.updateTaskStatus(value,widget.isCompletedTaskpage,globalTasks[index]);
                            // _controller.updateValue(widget.isCompletedTaskpage,globalTasks[index]);
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
                          if(!widget.isCompletedTaskpage)
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditTodo(
                                      task: globalTasks[index],
                                  
                                      // taskname: globalTasks[index].task ?? "",
                                      // taskdescription: globalTasks[index].description ?? "",
                                      // priority: globalTasks[index].priority??"",
                                      // date: globalTasks[index].date??"",
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
                                _controller.delete(widget.isCompletedTaskpage,globalTasks[index]);
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
    );
  }
  }



