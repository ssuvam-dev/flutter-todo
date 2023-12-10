import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:todo/components/app_bar.dart';
import 'package:todo/components/percentIndicator.dart';
import 'package:todo/components/piechart.dart';
import 'package:todo/utils/colors.dart';

class Statistic extends StatefulWidget {
  const Statistic({super.key});

  @override
  State<Statistic> createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:MyAppBar(apptitle: "Report",isFixedTitle: true,showDeleteButton: false),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 10.0,
            ),
            PercentIndicator(),
            SizedBox(
              height: 20.0,
            ),
            PieChartState(),
            
          ],
        ),
      ),
    );
  }
}