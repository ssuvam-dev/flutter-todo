import 'package:flutter/material.dart';
import 'package:todo/utils/colors.dart';
import 'package:todo/views/create_task.dart';
import 'package:lottie/lottie.dart';

class EmptyList extends StatefulWidget {
   EmptyList({
    Key? key,
    this.message="Empty List",
    required this.isCompletedTaskpage
   });  
   final String message;
   bool isCompletedTaskpage;
  String getMessage()
  {
    if(this.isCompletedTaskpage)
    {
      return "No Completed Task";
    }
    else{
      return "No Task Added yet";
    }
      
  }
  @override
  State<EmptyList> createState() => _EmptyListState();
}

class _EmptyListState extends State<EmptyList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/images/animation.json'),

            SizedBox(height: 10.0),
            Text(
              widget.getMessage(),
              style: TextStyle(
                fontSize: 20.0,
                color: Color(0xFFff595e),
                fontWeight: FontWeight.w600
              ),
            ),
            if(!widget.isCompletedTaskpage)
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (contect)=>CreateTask())
                );
              },
              child: Container(
                margin: EdgeInsets.only(top: 20.0),
                width: MediaQuery.of(context).size.width * 0.45,
                decoration: BoxDecoration(
                  // color: Color.fromRGBO(106, 99, 246, 1),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  border: Border.all(
                    color: Color.fromRGBO(106, 99, 246, 1),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color:Color.fromRGBO(139, 38, 206, 1),
                        ),
                      Text(
                        "Add One",
                        style: TextStyle(
                          color: Color.fromRGBO(139, 38, 206, 1),
                          fontSize: 17.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
