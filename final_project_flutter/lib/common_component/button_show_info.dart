// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

class ShowInfoButtom extends StatefulWidget {
  String name;
  String id;
  num totalCostFarm, totalAreaOfFarm;
  String sectionType;
  num numberOfWorkersInner, numberOfWorkersOuter;
  ShowInfoButtom(
      {super.key,
      required this.name,
      required this.totalCostFarm,
      required this.id,
      required this.totalAreaOfFarm,
      required this.sectionType,
      required this.numberOfWorkersOuter,
      required this.numberOfWorkersInner});
  @override
  State<ShowInfoButtom> createState() => _ShowInfoButtomState();
}

class _ShowInfoButtomState extends State<ShowInfoButtom> {
  bool isVisb = false;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      child: const Icon(Icons.location_on),
      itemBuilder: (context) {
        return <PopupMenuEntry>[
          PopupMenuItem(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Wrap(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(color: Colors.red),
                      ),
                      const Text(
                        ":الاسم",
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.totalCostFarm.toString(),
                        style: const TextStyle(color: Colors.red),
                      ),
                      const Text(
                        ":التكلفة الكلية",
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.totalAreaOfFarm.toString(),
                        style: const TextStyle(color: Colors.red),
                      ),
                      const Text(
                        ":المساحة الكلية",
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.sectionType,
                        style: const TextStyle(color: Colors.red),
                      ),
                      const Text(
                        ":نوع القطاع ",
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.numberOfWorkersInner.toString(),
                        style: const TextStyle(color: Colors.red),
                      ),
                      const Text(
                        ": عدد  العمالة الدخلية ",
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.numberOfWorkersOuter.toString(),
                        style: const TextStyle(color: Colors.red),
                      ),
                      const Text(
                        ": عدد  العمالة الخارجية ",
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ];
      },
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 5.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
