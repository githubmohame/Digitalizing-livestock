import 'dart:math';

import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartScreen extends StatelessWidget {
  ChartScreen({Key? key}) : super(key: key);
  TooltipBehavior tooltipBehavior = TooltipBehavior(tooltipPosition: TooltipPosition.pointer,shared: true,canShowMarker: true,
    enable: true,
    builder: (data, point, series, pointIndex, seriesIndex) {
      return Container(color: Colors.white,height: 150,width: 150,child: Column(children: [
        Text((series as ColumnSeries).xAxisName.toString()+":"+(data as Test).gavernorate),
        Text((series as ColumnSeries).yAxisName.toString()+":"+(data as Test).weight.toString()),
      ],),);
    },
  );
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection:TextDirection.rtl ,
      child: Scaffold(drawer: MainDrawer(index:8 ),
          appBar: AppBar( title: const Center(child: Text('الاحصائيات')),
            backgroundColor: Colors.brown,
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 500,
                  child: SfCircularChart(
                    title: ChartTitle(text: 'عدد مزارع الالبان'),
                    legend: Legend(isVisible: true),
                    series: <CircularSeries>[
                      PieSeries<Test, String>(
                          //groupTo: 2,
                          //groupMode: CircularChartGroupMode.point,
                          dataLabelSettings: const DataLabelSettings(isVisible: true),dataLabelMapper: (Test datum, index) => datum.gavernorate+'\n'+datum.weight.toString(),
                          dataSource: getTest(1),
                          xValueMapper: (Test datum, index) => datum.gavernorate,
                          yValueMapper: (Test datum, index) => datum.weight)
                    ],
                  ),
                ),
                SizedBox(
                  height: 700,
                  child: SfCartesianChart(
                    legend: Legend(isVisible: true),
                    tooltipBehavior: tooltipBehavior,
                    title: ChartTitle(text: 'عدد مزارع اللحوم'),
                    series: <ColumnSeries>[
                      ColumnSeries<Test, String>(xAxisName:"المحافظات" ,
                          enableTooltip: true,yAxisName: "عدد المزارع",
                          dataSource: getTest(1),
                          xValueMapper: (Test datum, index) => datum.gavernorate,
                          yValueMapper: (Test datum, index) => datum.weight)
                    ],
                    primaryXAxis: CategoryAxis(isVisible: true,title: AxisTitle(text: "المحافظات" ,textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Roboto',
                                      fontSize: 16,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w300
                                  ))),
                    
                  ),
                ),
                SizedBox(height: 1400,
                  child: SfCartesianChart(
                    title: ChartTitle(text: 'عدد رؤوس الماشية'),tooltipBehavior: tooltipBehavior,
                    series: <ColumnSeries<Test, String>>[
                      ColumnSeries<Test, String>(enableTooltip: true,
                          dataSource: getTest(-1),
                          xValueMapper: (Test datum, index) => datum.gavernorate,
                          yValueMapper: (Test datum, index) => datum.weight)
                    ],
                    primaryXAxis: CategoryAxis(isVisible: true,title: AxisTitle(text: "المحافظات" ,textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Roboto',
                                      fontSize: 16,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w300
                                  ))),
                  ),
                ),
                SizedBox(height: 500,
                  child: SfCartesianChart(tooltipBehavior: tooltipBehavior,
                    title: ChartTitle(text: 'عدد المربين'),
                    series: <ColumnSeries>[
                      ColumnSeries<Test, String>(enableTooltip: true,
                          dataSource: getTest(-1),
                          xValueMapper: (Test datum, index) => datum.gavernorate,
                          yValueMapper: (Test datum, index) => datum.weight)
                    ],
                    primaryXAxis: CategoryAxis(isVisible: true,title: AxisTitle(text: "المحافظات" ,textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Roboto',
                                      fontSize: 16,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w300
                                  ))),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

List<Test> getTest(int x) {
  return List<Test>.generate(
      30,
      (index) => Test(
          gavernorate: "t" + index.toString(),
          weight: (2*1* index).toDouble())).reversed.toList();
}

class Test {
  final String gavernorate;
  final double weight;
  Test({
    required this.gavernorate,
    required this.weight,
  });
}
