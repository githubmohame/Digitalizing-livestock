import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowInfoButtom extends StatefulWidget {
  const ShowInfoButtom({super.key});

  @override
  State<ShowInfoButtom> createState() => _ShowInfoButtomState();
}

class _ShowInfoButtomState extends State<ShowInfoButtom> {
  bool is_visb = false;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(child: Icon(Icons.location_on),
      itemBuilder: (context) {
        return <PopupMenuEntry>[PopupMenuItem(child: Container( child: SingleChildScrollView(scrollDirection: Axis.vertical,child: Wrap(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("ابو محمد",style: TextStyle(color: Colors.red),),Text(":الاسم",style: TextStyle(color: Colors.blue),)
              ],
            ),
          Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("1234567",style: TextStyle(color: Colors.red),),Text(":التكلفة الكلية",style: TextStyle(color: Colors.blue),)
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("1234صثق",style: TextStyle(color: Colors.red),),Text(":عدد الفدنة",style: TextStyle(color: Colors.blue),)
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("1234صثق",style: TextStyle(color: Colors.red),),Text(":نوع القطاع ",style: TextStyle(color: Colors.blue),)
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("1234صثق",style: TextStyle(color: Colors.red),),Text(": عدد  العمالة الدخلية ",style: TextStyle(color: Colors.blue),)
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("1234صثق",style: TextStyle(color: Colors.red),),Text(": عدد  العمالة الخارجية ",style: TextStyle(color: Colors.blue),)
              ],
            ),
            
            ],
        ),),),)];
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
