import 'package:final_project_year/common_component/color_plette.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TotalStatisticsPieChart extends StatelessWidget {
  TotalStatisticsPieChart(
      {super.key,
      this.width,
      required List<dynamic> statistic,
      required this.text}) {
    if (statistic.isEmpty) {
      statistic = [];
    }
    int access = 0;
    print(statistic);
    for (Map s in statistic) {
      pieSection.add(PieChartSectionData(
          title: s["platoon"],
          titleStyle: const TextStyle(color: Colors.black),
          showTitle: true,
          value: s["animal_number2"].toDouble(),
          radius: 120,
          color: CustomeColor.colorsPie[access]));

      listTotalStatisticsPieChartItem.add(TotalStatisticsPieChartItem(
        icon: CircleAvatar(
          radius: 5,
          backgroundColor: CustomeColor.colorsPie[access],
        ),
        diescript: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              s["platoon"].toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: CustomeColor.colorsPie[access],
                  fontSize: 15),
            ),
          ],
        ),
        size: s["animal_number2"].toDouble(),
        text: Text(
          s["animal_number2"].toString(),
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: CustomeColor.colorsPie[access],
              fontSize: 15),
        ),
      ));
      access += 1;
      access = access % Colors.primaries.length;
    }
  }
  List<PieChartSectionData> pieSection = [];
  List<TotalStatisticsPieChartItem> listTotalStatisticsPieChartItem = [];
  //List<Map> statistic;
  double? width;
  String text;
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
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
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
                        sections: () {
                          return pieSection;
                        }(),
                      )),
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(
              height: 100,
            ),
            ...() {
              return listTotalStatisticsPieChartItem;
            }(),
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
