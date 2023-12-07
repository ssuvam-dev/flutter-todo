import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo/components/bottom_navigation.dart';
import 'package:todo/screens/screen1.dart';
import 'package:todo/screens/screen2.dart';
import 'package:todo/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  PageController _pageController = PageController();
  bool isLastPage=false;
  @override
  void initState() {
    super.initState();

    // Timer(
    //   Duration(seconds:3),
    //    () {
    //     Navigator.pushReplacement(context,
    //      MaterialPageRoute(builder: ((context) => MyBottomNavBar())
    //      ));
    // });
  }
  @override
  Widget build(BuildContext context) {
    return  Material(
      color: Colors.white,
      child: SafeArea(
        child: Stack(
          children: [PageView(
            onPageChanged: (value) {
              setState(() {
                
                isLastPage = (value==1);
              });
            },
            controller: _pageController,
            children: [
              ScreenFirst(),
              ScreenTwo()
              
             
          ]
          ),
          Container(

            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: 
            [
              !isLastPage?
              GestureDetector(
                onTap: () {
                  _pageController.jumpToPage(1);
                },
                child: Text("Skip",style: TextStyle(
                  color:Color.fromRGBO(106, 99, 246, 1),
                  fontSize: 18.0,
                ),),
              ):
              GestureDetector(
                onTap: () {
                  _pageController.jumpToPage(0);
                },
                child: Text(" Previous",
                style: TextStyle(
                  color:Color.fromRGBO(106, 99, 246, 1),
                  fontSize: 18.0,
                ),),
              )
              ,
              SmoothPageIndicator(controller: _pageController, count: 2),
              !isLastPage ?
              GestureDetector(
                onTap: () {
                  _pageController.nextPage(duration: Duration(milliseconds: 500), curve:Curves.easeIn);
                },
                child: Text("Next",style: TextStyle(
                  color:Color.fromRGBO(106, 99, 246, 1),
                  fontSize: 18.0,
                ),),
              ):
               SizedBox(
                    width: 140,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.pushReplacement(context,
         MaterialPageRoute(builder: ((context) => MyBottomNavBar())
         ));
                      },
                       style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(106, 99, 246, 1),
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      shadowColor: Colors.grey[400],
                      elevation: 4
                    ),
                      child: const Text('Get Started')
                    ),
                  ),
              
          ]),
          )
        ]),
        
      )
    );
  }
}