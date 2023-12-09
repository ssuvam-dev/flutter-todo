import 'package:flutter/material.dart';
import 'package:todo/utils/colors.dart';
import 'package:todo/views/completed_task.dart';
// import 'package:todo/views/create_task.dart';
// import 'package:todo/views/create_task.dart';
// import 'package:todo/views/edit_task.dart';
import 'package:todo/views/home.dart';
import 'package:todo/views/stat.dart';
// import 'package:todo/views/home.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});
 
  @override
  State<MyBottomNavBar> createState() => __MyBottomNavBarState();
}

class __MyBottomNavBarState extends State<MyBottomNavBar> {
   int mycurrentIndex=0;
  List pages = const[
Home(),
CompletedTask(),
Statistic()
];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[mycurrentIndex],
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            setState(
              (){
                Navigator.pushNamed(context, '/create_task');
              }
            )
          },
          backgroundColor: themeColor,

          child: const Icon(
            Icons.add,
            
          )
        ),


        bottomNavigationBar: BottomNavigationBar(
          items:const [
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_outlined,
              color: themeColor,),
              label: 'Todo'
            ),


              BottomNavigationBarItem(
              icon: Icon(
                Icons.checklist_outlined,
                color: themeColor,),
              label: 'Completed'
            ),

            BottomNavigationBarItem(
              icon: Icon(
                Icons.query_stats_sharp,
                color: themeColor,),
              label: 'Report'
            ),
          ],
          currentIndex:mycurrentIndex,
          onTap: (index) {
            setState(() {
              mycurrentIndex=index;
            });
          },

      ),
    );
  }
}