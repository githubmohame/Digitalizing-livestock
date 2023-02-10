import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/farm.jpg'))),
        child: LayoutBuilder(
          builder: (context,constraint) {
            return ListView(children:[SafeArea(
                child: Container(height: constraint.maxHeight-90,width: constraint.maxWidth,
                  child: Row(
                              children: [
                  Spacer(),
                  Expanded(
                    child: Container(color: Colors.white.withOpacity(0.4),
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Spacer(),
                                Expanded(
                                  child: FloatingActionButton(
                                      mini: true,
                                      heroTag: 'farmer',
                                      backgroundColor: Colors.white,
                                      onPressed: () {},
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/images/farmer.png'),
                                          const Text(
                                            "عدد المربين الافراد",
                                            style: TextStyle(
                                                color: Color(0xff9c6644),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            6578654.toString(),
                                            style: const TextStyle(
                                                color: Color(0xff9c6644),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )),
                                ),
                                Spacer(),
                                Expanded(
                                  child: FloatingActionButton(
                                      mini: true,
                                      heroTag: 'farmer',
                                      backgroundColor: Colors.white,
                                      onPressed: () {},
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/images/farmer.png'),
                                          const Text(
                                            "عدد المربين الافراد",
                                            style: TextStyle(
                                                color: Color(0xff9c6644),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            6578654.toString(),
                                            style: const TextStyle(
                                                color: Color(0xff9c6644),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )),
                                ),
                                Spacer(),
                                Expanded(
                                  child: FloatingActionButton(
                                      mini: true,
                                      heroTag: 'farmer',
                                      backgroundColor: Colors.white,
                                      onPressed: () {},
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/images/farmer.png'),
                                          const Text(
                                            "عدد المربين الافراد",
                                            style: TextStyle(
                                                color: Color(0xff9c6644),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            6578654.toString(),
                                            style: const TextStyle(
                                                color: Color(0xff9c6644),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: FloatingActionButton(
                                      mini: true,
                                      heroTag: 'farmer',
                                      backgroundColor: Colors.white,
                                      onPressed: () {},
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/images/farmer.png'),
                                          const Text(
                                            "عدد المربين الافراد",
                                            style: TextStyle(
                                                color: Color(0xff9c6644),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            6578654.toString(),
                                            style: const TextStyle(
                                                color: Color(0xff9c6644),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )),
                                ),
                                Spacer(),
                                Expanded(
                                  child: FloatingActionButton(
                                      mini: true,
                                      heroTag: 'farmer',
                                      backgroundColor: Colors.white,
                                      onPressed: () {},
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/images/farmer.png'),
                                          const Text(
                                            "عدد المربين الافراد",
                                            style: TextStyle(
                                                color: Color(0xff9c6644),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            6578654.toString(),
                                            style: const TextStyle(
                                                color: Color(0xff9c6644),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )),
                                ),
                                Spacer(),
                                Expanded(
                                  child: FloatingActionButton(
                                      mini: true,
                                      heroTag: 'farmer',
                                      backgroundColor: Colors.white,
                                      onPressed: () {},
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/images/farmer.png'),
                                          const Text(
                                            "عدد المربين الافراد",
                                            style: TextStyle(
                                                color: Color(0xff9c6644),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            6578654.toString(),
                                            style: const TextStyle(
                                                color: Color(0xff9c6644),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: FloatingActionButton(
                                      mini: true,
                                      heroTag: 'farmer',
                                      backgroundColor: Colors.white,
                                      onPressed: () {},
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/images/farmer.png'),
                                          const Text(
                                            "عدد المربين الافراد",
                                            style: TextStyle(
                                                color: Color(0xff9c6644),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            6578654.toString(),
                                            style: const TextStyle(
                                                color: Color(0xff9c6644),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )),
                                ),
                                Spacer(),
                                Expanded(
                                  child: FloatingActionButton(
                                      mini: true,
                                      heroTag: 'farmer',
                                      backgroundColor: Colors.white,
                                      onPressed: () {},
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/images/farmer.png'),
                                          const Text(
                                            "عدد المربين الافراد",
                                            style: TextStyle(
                                                color: Color(0xff9c6644),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            6578654.toString(),
                                            style: const TextStyle(
                                                color: Color(0xff9c6644),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )),
                                ),
                                Spacer(),
                                Expanded(
                                  child: FloatingActionButton(
                                      mini: true,
                                      heroTag: 'farmer',
                                      backgroundColor: Colors.white,
                                      onPressed: () {},
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/images/farmer.png'),
                                          const Text(
                                            "عدد المربين الافراد",
                                            style: TextStyle(
                                                color: Color(0xff9c6644),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            6578654.toString(),
                                            style: const TextStyle(
                                                color: Color(0xff9c6644),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: Container(color: Colors.white.withOpacity(0.4))),
                  Flexible(
                    child: Container(color: Colors.white.withOpacity(0.4),
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: FloatingActionButton(
                                      mini: true,
                                      heroTag: 'farmer',
                                      backgroundColor: Colors.white,
                                      onPressed: () {},
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/images/farmer.png'),
                                          const Text(
                                            "عدد المربين الافراد",
                                            style: TextStyle(
                                                color: Color(0xff9c6644),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            6578654.toString(),
                                            style: const TextStyle(
                                                color: Color(0xff9c6644),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )),
                                ),
                                Spacer(),
                                Expanded(
                                  child: FloatingActionButton(
                                      mini: true,
                                      heroTag: 'farmer',
                                      backgroundColor: Colors.white,
                                      onPressed: () {},
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/images/farmer.png'),
                                          const Text(
                                            "عدد المربين الافراد",
                                            style: TextStyle(
                                                color: Color(0xff9c6644),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            6578654.toString(),
                                            style: const TextStyle(
                                                color: Color(0xff9c6644),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: FloatingActionButton(
                                      mini: true,
                                      heroTag: 'farmer',
                                      backgroundColor: Colors.white,
                                      onPressed: () {},
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/images/farmer.png'),
                                          const Text(
                                            "عدد المربين الافراد",
                                            style: TextStyle(
                                                color: Color(0xff9c6644),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            6578654.toString(),
                                            style: const TextStyle(
                                                color: Color(0xff9c6644),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )),
                                ),
                                Spacer(),
                                Expanded(
                                  child: FloatingActionButton(
                                      mini: true,
                                      heroTag: 'farmer',
                                      backgroundColor: Colors.white,
                                      onPressed: () {},
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/images/farmer.png'),
                                          const Text(
                                            "عدد المربين الافراد",
                                            style: TextStyle(
                                                color: Color(0xff9c6644),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            6578654.toString(),
                                            style: const TextStyle(
                                                color: Color(0xff9c6644),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: FloatingActionButton(
                                      mini: true,
                                      heroTag: 'farmer',
                                      backgroundColor: Colors.white,
                                      onPressed: () {},
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/images/farmer.png'),
                                          const Text(
                                            "عدد المربين الافراد",
                                            style: TextStyle(
                                                color: Color(0xff9c6644),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            6578654.toString(),
                                            style: const TextStyle(
                                                color: Color(0xff9c6644),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )),
                                ),
                                Spacer(),
                                Expanded(
                                  child: FloatingActionButton(
                                      mini: true,
                                      heroTag: 'farmer',
                                      backgroundColor: Colors.white,
                                      onPressed: () {},
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/images/farmer.png'),
                                          const Text(
                                            "عدد المربين الافراد",
                                            style: TextStyle(
                                                color: Color(0xff9c6644),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            6578654.toString(),
                                            style: const TextStyle(
                                                color: Color(0xff9c6644),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                               Spacer()
                              ],
                            ),
                )),Container(margin: EdgeInsets.only(bottom: 20),height: 300,width: double.infinity,child:  Row(
                  children: [ Container(width: constraint.maxWidth/5,),
                    Expanded(
                      child: Container(color: Colors.white.withOpacity(0.4),
                        child: Column(
                          children: [Text('خريطة الانتشار',style: TextStyle(fontSize: 30),),
                            Expanded(
                              child: FlutterMap(
                                options: MapOptions(
                                    center: LatLng(51.509364, -0.128928),
                                    zoom: 9.2,
                                ),
                                nonRotatedChildren: [
                                    AttributionWidget.defaultWidget(
                                        source: 'OpenStreetMap contributors',
                                        onSourceTapped: null,
                                    ),
                                ],
                                children: [
                                    TileLayer(
                                        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                        userAgentPackageName: 'com.example.app',
                                    ),
                                ],
                                                ),
                            ),
                          ],
                        ),
                      ),
                    ),
                      Container(width: constraint.maxWidth/5,),
                  ],
                ))]
      );
          }
        )),
    );
  }
}
