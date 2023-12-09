import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:get/get.dart';
import 'package:todo/controller/taskcontroller.dart';
import 'package:todo/utils/colors.dart';

class PercentIndicator extends StatefulWidget {
   PercentIndicator({super.key});

  @override
  State<PercentIndicator> createState() => _PercentIndicatorState();
}

class _PercentIndicatorState extends State<PercentIndicator> {
    TaskController _controller = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(
      builder: (_) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                  color: Color.fromRGBO(138, 138, 141, 0.898), 
                  blurRadius: 4.0,
                  offset: Offset(4, 4)),
                ],
                borderRadius: BorderRadius.circular(15),
          ),
          margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                new CircularPercentIndicator(
                                    radius: 130.0,
                                    animation: true,
                                    animationDuration: 2000,
                                    lineWidth: 20.0,
                                    percent: _controller.getResult(),                          
                                    center: new Text(_controller.getResultMessage(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: iconColor,
                                      fontWeight: FontWeight.bold,
                                    
                                    ),),
                                    progressColor: Color.fromRGBO(106, 99, 246, 1),
                                    backgroundColor: Color.fromRGBO(144, 139, 231, 1),
                                    circularStrokeCap: CircularStrokeCap.round,
                                   
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0,bottom:10.0),
                    child: Text(
                      "Fig: Efficiency Report",
                      style: TextStyle(
                        fontSize: 15.0,
                        
                      ),
                    ),
                  ),
              ],
            )
        );
      }
    );
  }
}