import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
 Widget build(BuildContext context) {
     return Container(
      child: Column(
        children: [
           Container(
                child: Container(
                  child:Image(image: AssetImage("assets/images/todo.png"),
                  height: 500.0,),
                ),
              ),
          
              Text(
                "Visualize Report",
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(106, 99, 246, 1)
                ),
              ),
          
              
              SizedBox(height: 12.0,),
              Text(
                "Stop Procrastinating! Analyze your report with us with visual data",
                textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black
              ),),
        ],
      ),
     );
    
  }
}