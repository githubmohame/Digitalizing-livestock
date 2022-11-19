import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartScreen extends StatelessWidget {
  ChartScreen({Key? key}) : super(key: key);
  TooltipBehavior tooltipBehavior = TooltipBehavior(enable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
        ),
        backgroundColor: Color(0x0FFFb0b348),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: SfCircularChart(
                  title: ChartTitle(text: 'tell me'),
                  legend: Legend(isVisible: true),
                  tooltipBehavior: tooltipBehavior,
                  series: <CircularSeries>[
                    PieSeries<Test, String>(
                        enableTooltip: true,
                        groupTo: 2,
                        //groupMode: CircularChartGroupMode.point,
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                        dataSource: getTest(),
                        xValueMapper: (Test datum, index) => datum.gavernorate,
                        yValueMapper: (Test datum, index) => datum.weight)
                  ],
                ),
              ),
              Container(height: 1300 ,
                child: SfCartesianChart(
                  title: ChartTitle(text: 'tell me'),
                  series: <ChartSeries>[
                    BarSeries<Test, String>(  
                        dataSource: getTest(),
                        xValueMapper: (Test datum, index) => datum.gavernorate,
                        yValueMapper: (Test datum, index) => datum.weight)
                  ],
                  primaryXAxis: CategoryAxis(),
                ),
              ),
               SfCartesianChart(
                title: ChartTitle(text: 'tell me'),
                series: <ColumnSeries<Test,String>>[
                  ColumnSeries<Test, String>(
                      dataSource: getTest(),
                      xValueMapper: (Test datum, index) => datum.gavernorate,
                      yValueMapper: (Test datum, index) => datum.weight)
                ],
                primaryXAxis: CategoryAxis(),
              ),
                SfCartesianChart(
                title: ChartTitle(text: 'tell me'),
                series: <ChartSeries>[
                  BarSeries<Test, String>(
                      dataSource: getTest(),
                      xValueMapper: (Test datum, index) => datum.gavernorate,
                      yValueMapper: (Test datum, index) => datum.weight)
                ],
                primaryXAxis: CategoryAxis(),
              ),
                SfCartesianChart(
                title: ChartTitle(text: 'tell me'),
                series: <ChartSeries>[
                  BarSeries<Test, String>(
                      dataSource: getTest(),
                      xValueMapper: (Test datum, index) => datum.gavernorate,
                      yValueMapper: (Test datum, index) => datum.weight)
                ],
                primaryXAxis: CategoryAxis(),
              ),
               
            ],
          ),
        ));
  }
}

List<Test> getTest() {
  return List<Test>.generate(100, (index) => Test(gavernorate: "t"+index.toString(),weight: (2*index).toDouble())).reversed.toList();
}

class Test {
  final String gavernorate;
  final double weight;
  Test({
    required this.gavernorate,
    required this.weight,
  });
}
