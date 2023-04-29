// ignore_for_file: public_member_api_docs, sort_constructors_first
/*import 'dart:math';

import 'package:final_project_year/common_component/background.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:final_project_year/common_component/main_diwer.dart';

class ChartScreen extends StatelessWidget {
  final List<ChartData> chartData = List.generate(
    5,
    (index) {
      return ChartData('juuu', 90 * (index + 12));
    },
  );
  final List<BarDataCustome> barChart = List.generate(
    2,
    (index) {
      return BarDataCustome(x: 89 * index, y: 70 * (index + 12), name: 'juuu');
    },
  );
  ChartScreen({Key? key}) : super(key: key);
  TooltipBehavior tooltipBehavior = TooltipBehavior(
    tooltipPosition: TooltipPosition.pointer,
    shared: true,
    canShowMarker: true,
    enable: true,
    builder: (data, point, series, pointIndex, seriesIndex) {
      return Container(
        color: Colors.white,
        height: 150,
        child: Column(
          children: [
            Text((series as ColumnSeries).xAxisName.toString() +
                ":" +
                (data as Test).gavernorate),
            Text((series as ColumnSeries).yAxisName.toString() +
                ":" +
                (data as Test).weight.toString()),
          ],
        ),
      );
    },
  );
  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
     
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            drawer: MainDrawer(index: 8),
            appBar: AppBar(
              title: const Center(child: Text('الاحصائيات',style: TextStyle(color: Colors.white),)),
              backgroundColor: Colors.transparent,
            ),
            backgroundColor: Colors.transparent,
            body: Row(
              children: [ Spacer(),
                SingleChildScrollView(scrollDirection: Axis.vertical,
                  child: Container(
                     child: Wrap(direction: Axis.vertical,
                      alignment: WrapAlignment.center,spacing: 50,crossAxisAlignment: WrapCrossAlignment.center,runSpacing: 50,
                      children: [
                         
                        Container(width: 500,decoration: BoxDecoration(color: Colors.white.withOpacity(0.3),borderRadius: BorderRadius.circular(30)),
                         
                          child:  SfCircularChart(series: <CircularSeries>[
                              // Render pie chart
                              PieSeries<ChartData, String>(dataSource: chartData,xValueMapper: (datum, index) => datum.name,yValueMapper: (datum, index) => datum.number,dataLabelMapper: (datum, index) => datum.name, explode: true,dataLabelSettings: DataLabelSettings(isVisible: true))
                          ]),
                        ) ,Container(width: 500,decoration: BoxDecoration(color: Colors.white.withOpacity(0.3),borderRadius: BorderRadius.circular(30)),
                         
                          child:  SfCircularChart(series: <CircularSeries>[
                              // Render pie chart
                              PieSeries<ChartData, String>(dataSource: chartData,xValueMapper: (datum, index) => datum.name,yValueMapper: (datum, index) => datum.number,dataLabelMapper: (datum, index) => datum.name, explode: true,dataLabelSettings: DataLabelSettings(isVisible: true))
                          ]),
                        ),Container(width: 500,decoration: BoxDecoration(color: Colors.white.withOpacity(0.3),borderRadius: BorderRadius.circular(30)),
                         
                          child:  SfCircularChart(series: <CircularSeries>[
                              // Render pie chart
                              PieSeries<ChartData, String>(dataSource: chartData,xValueMapper: (datum, index) => datum.name,yValueMapper: (datum, index) => datum.number,dataLabelMapper: (datum, index) => datum.name, explode: true,dataLabelSettings: DataLabelSettings(isVisible: true))
                          ]),
                        ),
                        Container(width: 500,decoration: BoxDecoration(color: Colors.white.withOpacity(0.3),borderRadius: BorderRadius.circular(30)),
                         
                          child:  SfCircularChart(series: <CircularSeries>[
                              // Render pie chart
                              PieSeries<ChartData, String>(dataSource: chartData,xValueMapper: (datum, index) => datum.name,yValueMapper: (datum, index) => datum.number,dataLabelMapper: (datum, index) => datum.name, explode: true,dataLabelSettings: DataLabelSettings(isVisible: true))
                          ]),
                        )
                      ],
                    ),
                  ),
                ),Spacer(),
              ],
            )),
      ),
    );
  }
}

class ChartData {
  String name;
  int number;
  ChartData(String s, int i)
      : name = s,
        number = i {}
}

List<Test> getTest(int x) {
  return List<Test>.generate(
      30,
      (index) => Test(
          gavernorate: "t" + index.toString(),
          weight: (2 * 1 * index).toDouble())).reversed.toList();
}

List<BarChartGroupData> getTest2() {
  return List<BarChartGroupData>.generate(
      30,
      (index) => BarChartGroupData(barRods: [
            BarChartRodData(
                borderRadius: BorderRadius.zero,
                width: 12,
                rodStackItems: [],
                toY: index * 12)
          ], x: 56));
}

class Test {
  final String gavernorate;
  final double weight;
  Test({
    required this.gavernorate,
    required this.weight,
  });
}

class BarDataCustome {
  int x;
  int y;
  String name;
  BarDataCustome({
    required this.x,
    required this.y,
    required this.name,
  });
}

List<PieChartSectionData> get_pieChart() {
  return List.generate(
    27,
    (index) => PieChartSectionData(
        borderSide: BorderSide(
          width: 1,
          color: Colors.grey,
        ),
        badgePositionPercentageOffset: 0.5,
        titleStyle: TextStyle(),
        showTitle: false,
        color: Colors.red,
        value: 67.8 * index,
        radius: 150),
  );
}

class PieChart2 extends StatelessWidget {
  Map<String, double> f;
  PieChart2({
    Key? key,
    required this.f,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(scrollDirection: Axis.horizontal,
      child: Container(
           
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),margin: EdgeInsets.all(30),
          height: 1300,
          child: CustomPaint(
            foregroundPainter: LinePainter(
                margin: List.generate(f.length, (index) {
              return f[(index * 900).toString()]! *
                  300 /
                  f[(900 * 9).toString()]!;
            })),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: List.generate(f.length, (index) {
                        return Tooltip(message: 'iiiio',
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            height: f[(index * 900).toString()]! *
                                300 /
                                f[(900 * 9).toString()]!,
                            width: 50,
                            color: Colors.red,
                          ),
                        );
                      })),
                ),
              ],
            ),
          )),
    );
  }
}

class LinePainter extends CustomPainter {
  List<double> margin;
  LinePainter({
    required this.margin,
  });
  @override
  void paint(Canvas canvas, Size size) {
    List reverse = margin.reversed.toList();
    for (int i = 0; i < margin.length;i++) {
      final textStyle = TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 12,
      );
      final textSpan = TextSpan(
        text: reverse[i].round().toString(),
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(
        minWidth: 0,
        maxWidth: size.width,
      );

      final offset = Offset(-10, margin[i]-5);
      textPainter.paint(canvas, offset);
      canvas.drawLine(
          Offset(0, margin[i]),
          Offset(size.width, margin[i]),
          Paint()
            ..strokeWidth = 3
            ..color = Colors.amber.withOpacity(0.5));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
*/