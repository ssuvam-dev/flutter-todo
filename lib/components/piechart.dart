import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:todo/controller/taskcontroller.dart';
import 'package:get/get.dart';

class PieChartState extends StatefulWidget {
  const PieChartState({super.key});

  @override
  State<PieChartState> createState() => _PieChartStateState();
}

class _PieChartStateState extends State<PieChartState> {
 TaskController _controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
    "High Priority Task": _controller.getHighPriorityTask().length.toDouble() + _controller.getCompletedHighPriorityTask().length.toDouble()??0.0,
    "Low Priority Task": _controller.getLowPriorityTask().length.toDouble()+_controller.getCompletedLowPriorityTask().length.toDouble()??0.0,
    "Medium Priority Task": _controller.getMediumPriorityTask().length.toDouble() + _controller.getCompletedMediumPriorityTask().length.toDouble()??0.0,

  };
        return GetBuilder<TaskController>(
          builder: (_) {
            return Container(
                          width: double.infinity,
              decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                  BoxShadow(color: Color.fromRGBO(138, 138, 141, 0.898), blurRadius: 4, offset: Offset(4, 4)),
                    ],
                    borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    PieChart(
                      dataMap: dataMap,
                      centerText: _controller.getCenterText(),
                      chartType: ChartType.disc,
                      animationDuration: Duration(milliseconds: 2000),
                      chartRadius: MediaQuery.of(context).size.width *0.5,
                      legendOptions: LegendOptions(
                          showLegendsInRow: false ,
                          legendPosition: LegendPosition.bottom,
                          showLegends: _controller.getCenterText().length == 0,
                          legendTextStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:8.0,bottom:10.0),
                        child: Text(
                          "Fig: Task Report",
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