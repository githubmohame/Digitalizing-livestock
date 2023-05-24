import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TotalStatisticsPieChart extends StatelessWidget {
  TotalStatisticsPieChart({super.key, this.width, required this.statistic}) {
    if (statistic.isEmpty) {
      statistic = [0, 0, 0];
    }
  }
  List<int> statistic;
  double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                margin: const EdgeInsets.only(left: 20, top: 10, bottom: 2),
                child: const Text(
                  'معلومات عن النظام',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )),
            LayoutBuilder(builder: (context, constraint) {
              return Container(
                width: constraint.maxWidth / 3,
                height: 70,
                margin: EdgeInsets.all(constraint.maxWidth / 6),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(100),
                      child: PieChart(PieChartData(
                          borderData: FlBorderData(
                            show: true,
                          ),
                          centerSpaceRadius: 0,
                          sections: [
                            PieChartSectionData(
                                title: "الجمال",
                                titleStyle:
                                    const TextStyle(color: Colors.white),
                                showTitle: true,
                                value: statistic[0].toDouble(),
                                radius: 120,
                                color: const Color(0xff9e65ff)),
                            PieChartSectionData(
                                title: "الابقار",
                                titleStyle:
                                    const TextStyle(color: Colors.white),
                                showTitle: true,
                                value: statistic[2].toDouble(),
                                radius: 120,
                                color: const Color(0xFFfea43a)),
                            PieChartSectionData(
                                title: "الخرفان",
                                titleStyle:
                                    const TextStyle(color: Colors.white),
                                showTitle: true,
                                value: statistic[1].toDouble(),
                                radius: 120,
                                color: Colors.blue)
                          ])),
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(
              height: 100,
            ),
            TotalStatisticsPieChartItem(
              text: Text(
                statistic[2].toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                    fontSize: 15),
              ),
              icon: const CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 5,
              ),
              diescript: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'الابقار',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                        fontSize: 15),
                  ),
                ],
              ),
              size: statistic[2].toDouble(),
            ),
            TotalStatisticsPieChartItem(
              icon: const CircleAvatar(
                  radius: 5, backgroundColor: Color(0xff9e65ff)),
              diescript: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'الجمال',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff9e65ff),
                        fontSize: 15),
                  ),
                ],
              ),
              size: statistic[0].toDouble(),
              text: Text(
                statistic[0].toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff9e65ff),
                    fontSize: 15),
              ),
            ),
            TotalStatisticsPieChartItem(
              icon: const CircleAvatar(
                radius: 5,
                backgroundColor: Colors.blue,
              ),
              diescript: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'الخرفان',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 15),
                  ),
                ],
              ),
              size: statistic[0].toDouble(),
              text: Text(
                statistic[0].toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class TotalStatisticsPieChartItem extends StatelessWidget {
  TotalStatisticsPieChartItem({
    Key? key,
    required this.icon,
    required this.diescript,
    required this.size,
    required this.text,
  }) : super(key: key);

  Widget diescript;
  Widget icon;
  double size;
  Widget text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(10),
      child: Row(children: [
        icon,
        Container(margin: const EdgeInsets.only(left: 10), child: diescript),
        const Spacer(),
        text,
      ]),
    );
  }
}
