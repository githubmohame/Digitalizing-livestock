import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SfCartesianChart(
          series: <ChartSeries>[
            BarSeries<Test,String>(
                dataSource: getTest(),
                xValueMapper: (Test datum, index) =>datum.gavernorate ,
                yValueMapper: (Test datum, index) =>datum.weight)
          ],
        )
      ],
    ));
  }
}

List<Test> getTest() {
  return [
    Test(gavernorate: 'jjkkuu',weight: 6789768667),
     Test(gavernorate: 'jjkkuu',weight: 6789768667),
      Test(gavernorate: 'jjkkuu',weight: 6789768667),
  ];
}

class Test {
  String gavernorate;
  int weight;
  Test({
    required this.gavernorate,
    required this.weight,
  });
}
