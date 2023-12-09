import 'package:flutter/material.dart';
import 'package:todo/models/tasks.dart';
import 'package:todo/utils/colors.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget{
  final String apptitle;
  final int total;
  final bool showDeleteButton;
  MyAppBar({
    super.key, 
    required this.apptitle,
    this.total=0,
    this.showDeleteButton =true
  }
);

@override
  Size get preferredSize => Size.fromHeight(60.0);
  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  final int now = DateTime.now().day;

@override
// Size get preferredSize =>const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return  AppBar(
        backgroundColor:themeColor,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${widget.apptitle} ${widget.total != 0 ? ' (${widget.total})' : ''}",
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700
              ),
            ),
            if(widget.showDeleteButton && globalTasks.isNotEmpty)
            ElevatedButton(
              onPressed: (){
                globalTasks.clear();
              }, 
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFff595e)
              ),
              child:  Row(
                  children: [
                    Text("Clear",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white
                    ),),
                    Padding(
                      padding: const EdgeInsets.only(left:3.0),
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
        ),
        
    );
  }
}