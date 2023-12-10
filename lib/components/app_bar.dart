import 'package:flutter/material.dart';
import 'package:todo/components/button_component.dart';
import 'package:todo/controller/taskcontroller.dart';
import 'package:todo/models/tasks.dart';
import 'package:todo/utils/colors.dart';
import 'package:get/get.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String apptitle;
  final int total;
  final bool showDeleteButton;
  final bool isCompletedTaskPage;
  final bool isFixedTitle;
  MyAppBar(
      {super.key,
      required this.apptitle,
      this.total = 0,
      this.showDeleteButton = true,
      this.isCompletedTaskPage = false,
      this.isFixedTitle = false});

  @override
  Size get preferredSize => Size.fromHeight(60.0);
  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  final int now = DateTime.now().day;
  TaskController _controller = Get.put(TaskController());

  @override
// Size get preferredSize =>const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: themeColor,
      elevation: 0.0,
      title: GetBuilder<TaskController>(builder: (_) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _controller.getAppBarTitle(widget.isCompletedTaskPage,
                  widget.isFixedTitle, widget.apptitle),
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
            ),
            if (widget.isCompletedTaskPage &&
                widget.showDeleteButton == true &&
                _controller.completedTasks.isNotEmpty)
              ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                      radius: 10.0,
                      titlePadding:
                          EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                      title: "Are you sure you want to delete all?",
                      content: Text(''),
                      // confirmTextColor: Colors.white,
                      onConfirm: () {
                        widget.isCompletedTaskPage
                            ? _controller.clearAll(true)
                            : _controller.clearAll(false);
                        Get.back();
                      },
                      contentPadding: EdgeInsets.only(
                          bottom: 20.0, left: 15.0, right: 15.0),
                      confirm: GestureDetector(
                          onTap: () {
                            widget.isCompletedTaskPage
                                ? _controller.clearAll(true)
                                : _controller.clearAll(false);
                            Get.back();
                          },
                          child: ButtonComponent(
                              name: "Delete", colorButton: true)),
                      cancel: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: ButtonComponent(name: "Cancel")));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFff595e)),
                child: Row(
                  children: [
                    Text(
                      "Clear",
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0),
                      child: Icon(
                        Icons.delete,
                        size: 18.0,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),

            if (!widget.isCompletedTaskPage &&
                widget.showDeleteButton == true &&
                _controller.globalTasks.isNotEmpty)
              ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                      radius: 10.0,
                      titlePadding:
                          EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                      title: "Are you sure you want to delete all?",
                      content: Text(''),
                      // confirmTextColor: Colors.white,
                      onConfirm: () {
                        widget.isCompletedTaskPage
                            ? _controller.clearAll(true)
                            : _controller.clearAll(false);
                        Get.back();
                      },
                      contentPadding: EdgeInsets.only(
                          bottom: 20.0, left: 15.0, right: 15.0),
                      confirm: GestureDetector(
                          onTap: () {
                            widget.isCompletedTaskPage
                                ? _controller.clearAll(true)
                                : _controller.clearAll(false);
                            Get.back();
                          },
                          child: ButtonComponent(
                              name: "Delete", colorButton: true)),
                      cancel: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: ButtonComponent(name: "Cancel")));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFff595e)),
                child: Row(
                  children: [
                    Text(
                      "Clear",
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0),
                      child: Icon(
                        Icons.delete,
                        size: 18.0,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),

            // Container(
            //   padding: EdgeInsets.symmetric(vertical: 9.0,horizontal: 15.0),
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius:BorderRadius.circular(4.0)
            //     ),
            //     child: Row(
            //       children: [
            //         Text("Clear",
            //         style: TextStyle(
            //           fontSize: 15.0,
            //           color: Colors.black
            //         ),),
            //         Padding(
            //           padding: const EdgeInsets.only(left:3.0),
            //           child: Icon(
            //             Icons.delete,
            //             size: 20.0,
            //           color: Color.fromARGB(255, 245, 125, 117),
            //           ),
            //         )
            //       ],
            //     ),
            // )

            // Stack(
            //   alignment: Alignment.center,
            //   children: [
            //     Icon(
            //       Icons.calendar_today_outlined,
            //       size: 30.0,
            //       ),
            //     Padding(
            //       padding: EdgeInsets.only(top:10.0),
            //       child: Text(
            //       now.toString(),
            //       style: TextStyle(
            //         fontSize: 12
            //       ),
            //       ),
            //     ),

            //   ],
            // )
          ],
        );
      }),
    );
  }
}
