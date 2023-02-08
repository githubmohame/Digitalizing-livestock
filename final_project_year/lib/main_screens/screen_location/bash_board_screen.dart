import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        child: SafeArea(
            child: Row(
          children: [
            Spacer(),
            Expanded(
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
            Spacer(),
            Flexible(
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
            Spacer()
          ],
        )),
      ),
    );
  }
}
