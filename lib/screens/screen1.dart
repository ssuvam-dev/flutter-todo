import 'package:flutter/material.dart';

class ScreenFirst extends StatelessWidget {
  const ScreenFirst({super.key});

  @override
  Widget build(BuildContext context) {
     return Container(
      child: Column(
        children: [
           Container(
                child: Container(
                  child:Image(image: AssetImage("assets/images/remainder.png"),
                  ),
                ),
              ),
          
              Text(
                "Multiple Device",
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(106, 99, 246, 1)
                ),
              ),
          
              
              SizedBox(height: 12.0,),
              Text(
                "Access from anywhere,write, organize, and reprioritize your tasks ",
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