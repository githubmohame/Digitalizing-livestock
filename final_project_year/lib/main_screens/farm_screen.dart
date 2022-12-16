import 'dart:async';
import 'package:final_project_year/bloc/choice/cubit/choice_cubit.dart';
import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:final_project_year/main_screens/Show_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:final_project_year/bloc/select_muilt_type/cubit/select_muilt_type_cubit.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CustomeDropdownButton extends StatefulWidget {
  int value;
  String text;
  bool expanded = false;
  List<Map<String, dynamic>> list;
  Function(int value)? func;
  CustomeDropdownButton({
    Key? key,
    this.func,
    required this.value,
    required this.text,
    required this.expanded,
    required this.list,
  }) : super(key: key);

  @override
  State<CustomeDropdownButton> createState() => _CustomeDropdownButtonState();
}

class _CustomeDropdownButtonState extends State<CustomeDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FutureBuilder<List<Map<String, dynamic>>>(
        builder: (context, snapshot) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(widget.text),
              ],
            ),
            DropdownButton<int>(
              style: TextStyle(color: Colors.brown),
              isExpanded: widget.expanded,
              underline: Container(),
              focusColor: Colors.white,
              alignment: Alignment.bottomLeft,
              value: widget.value,
              items: List.generate(widget.list.length, (index) {
                return DropdownMenuItem(
                    value: widget.list[index]["id"],
                    child: Text(widget.list[index]["name"]));
              }),
              onChanged: (value) {
                setState(() {
                  widget.value = value ?? 0;
                  if (widget.func is Function(int value) && value is int) {
                    widget.func!(value);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<Map<String, dynamic>>> f1() {
  return Future<List>.delayed(const Duration(seconds: 10)).then((value) => [
        {"kill": 'see'}
      ]);
}

class FarmScreen extends StatelessWidget {
  const FarmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(decoration:BoxDecoration(color: Colors.transparent,image: DecorationImage(fit: BoxFit.cover,image: AssetImage('assets/images/farm.jpg'))),
        child: Scaffold(appBar: AppBar(elevation: 0,
              backgroundColor: Colors.transparent,
              title: const Text("اضافه المزرعة")),
          backgroundColor: Colors.red.withOpacity(0),
          drawer: MainDrawer(index: 0),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.all(20),
                      width: 600,
                      color: Colors.white.withOpacity(0.5),
                      child: Form(
                          child: Column(
                        children: [
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Colors.white,
                            )),
                            margin: const EdgeInsets.all(10),
                            child: TextFormField(
                              validator: (value) {},
                              decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: InputBorder.none,
                                  hintText: 'رقم السجل الضريبي'),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Colors.grey,
                            )),
                            margin: const EdgeInsets.all(10),
                            child: TextFormField(
                              validator: (value) {},
                              decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: InputBorder.none,
                                  hintText: 'المساحة الكلية للمزرعة'),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Colors.white,
                            )),
                            margin: const EdgeInsets.all(10),
                            child: TextFormField(
                              validator: (value) {},
                              decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: InputBorder.none,
                                  hintText: 'ادخل اسم المزرعة'),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Colors.white,
                            )),
                            margin: const EdgeInsets.all(10),
                            child: TextFormField(
                              validator: (value) {
                                try {
                                  return int.parse(value ?? "0") <= 0
                                      ? " العدد يجب ان يكون اكبر من 0"
                                      : null;
                                } catch (e) {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: InputBorder.none,
                                  hintText: "اعدد الملاعب"),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Colors.white,
                            )),
                            margin: const EdgeInsets.all(10),
                            child: TextFormField(
                              validator: (value) {
                                try {
                                  return int.parse(value ?? "0") <= 0
                                      ? " العدد يجب ان يكون اكبر من 0"
                                      : null;
                                } catch (e) {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: InputBorder.none,
                                  hintText: "سعة الملاعب"),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Colors.white,
                            )),
                            margin: const EdgeInsets.all(10),
                            child: TextFormField(
                              validator: (value) {
                                try {
                                  return int.parse(value ?? "0") <= 0
                                      ? "  0العدد يجب ان يكون اكبر من او يساوي"
                                      : null;
                                } catch (e) {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: InputBorder.none,
                                  hintText: "اعدد العنابر"),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Colors.white,
                            )),
                            margin: const EdgeInsets.all(10),
                            child: TextFormField(
                              validator: (value) {
                                try {
                                  return int.parse(value ?? "0") <= 0
                                      ? "  0العدد يجب ان يكون اكبر من او يساوي"
                                      : null;
                                } catch (e) {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: InputBorder.none,
                                  hintText: 'عدد عنابر العزل'),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Colors.white,
                            )),
                            margin: const EdgeInsets.all(10),
                            child: TextFormField(
                              validator: (value) {},
                              decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: InputBorder.none,
                                  hintText: "ادخل عدد الافدنة الملحقة"),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Container(
                            height: 70,
                            margin: const EdgeInsets.all(10),
                            child: CustomeDropdownButton(
                              list: const [
                                {"id": 0, "name": "عام"},
                                {"id": 1, "name": "خاص"}
                              ],
                              expanded: true,
                              text: "نوع القطاع",
                              value: 0,
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.all(10), child: GoogleMapComponent()),
                          SizedBox(
                            height: 260,
                            child: Row(
                              children: [
                                Expanded(
                                    child: BlocProvider(
                                  create: (context) =>
                                      ChoiceCubit(city: 0, gavernorate: 0, village: 0),
                                  child: SelectLocation(),
                                )),
                              ],
                            ),
                          ),
                          BlocProvider(
                            create: (context) => SelectMuiltTypeCubit(list: []),
                            child: Container(
                              color: Colors.white,
                              margin: EdgeInsets.all(10),
                              child: CustomeType(
                                title: "نوع المزرعة",
                                list: const [
                                  {"عام": 1},
                                  {"خاص": 0}
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          OutlinedButton(
                            style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                                shape: MaterialStateProperty.resolveWith((states) =>
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30))),
                                backgroundColor: MaterialStateProperty.resolveWith(
                                    (states) => Colors.green),
                                overlayColor: MaterialStateProperty.resolveWith(
                                    (states) => Colors.green)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ShowInfoScreen(),
                                  ));
                            },
                            child: const Text(
                              "حفظ",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          OutlinedButton(
                            style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                                shape: MaterialStateProperty.resolveWith((states) =>
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30))),
                                backgroundColor: MaterialStateProperty.resolveWith(
                                    (states) => Colors.red),
                                overlayColor: MaterialStateProperty.resolveWith(
                                    (states) => Colors.red)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ShowInfoScreen(),
                                  ));
                            },
                            child: const Text(
                              "حذف",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SelectLocation extends StatefulWidget {
  SelectLocation({Key? key, this.village}) : super(key: key);
  String? village;
  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.white,
            )),
            child: CustomeDropdownButton(
                func: (int value) {
                  BlocProvider.of<ChoiceCubit>(context)
                      .updateGavernorate(value);
                },
                list: const [
                  {"id": 0, "name": "اسيوط"},
                  {"id": 1, "name": "القاهرة"},
                  {"id": 2, "name": "المنةفية"}
                ],
                expanded: true,
                value: 0,
                text: "المحافظة")),
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.white,
          )),
          child: BlocBuilder<ChoiceCubit, ChoiceState>(
            buildWhen: (previous, current) {
              //
              return previous.gavernorate != current.gavernorate;
            },
            builder: (context, state) {
              return CustomeDropdownButton(
                  func: (int value) {
                    BlocProvider.of<ChoiceCubit>(context).updateCity(value);
                  },
                  list: const [
                    {"id": 1, "name": "القاهرة"},
                    {"id": 0, "name": "القاهرة"}
                  ],
                  expanded: true,
                  value: 0,
                  text: "المركز او المدينة");
            },
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.white,
          )),
          child: BlocBuilder<ChoiceCubit, ChoiceState>(
            buildWhen: (previous, current) {
              return previous.city != current.city ||
                  previous.gavernorate != current.gavernorate;
            },
            builder: (context, state) {
              return CustomeDropdownButton(
                  func: (int value) {
                    BlocProvider.of<ChoiceCubit>(context).updateVillage(value);
                  },
                  list: const [
                    {"id": 1, "name": "القاهرة"},
                    {"id": 0, "name": "القاهرة"}
                  ],
                  expanded: true,
                  value: 0,
                  text: "القرية او الشارع");
            },
          ),
        ),
      ],
    );
  }
}

class CustomeType extends StatefulWidget {
  List<Map<String, dynamic>> list;
  String title;
  bool visiable = false;
  _CustomeTypeState state = _CustomeTypeState();
  CustomeType({Key? key, required this.list, required this.title})
      : super(key: key);
  @override
  State<CustomeType> createState() {
    return _CustomeTypeState();
  }
}

class _CustomeTypeState extends State<CustomeType> {
  _CustomeTypeState();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.grey,
            )),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: TextButton.icon(
                  onPressed: () {
                    widget.visiable = !widget.visiable;
                    setState(() {});
                  },
                  icon: Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                        textDirection: TextDirection.rtl,
                        size: 24,
                      )),
                  label: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(widget.title,
                          style: const TextStyle(color: Colors.black)))),
            )),
        Visibility(
          visible: widget.visiable,
          child: Container(
            decoration: const BoxDecoration(
                border: Border(
              bottom: BorderSide(color: Colors.grey),
              right: BorderSide(color: Colors.grey),
              left: BorderSide(color: Colors.grey),
            )),
            height: 50,
            child: BlocBuilder<SelectMuiltTypeCubit, SelectMuiltTypeState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: widget.list.length,
                  itemBuilder: (context, index) {
                    List<int> list = state.list;
                    CustomeButton d;
                    if (list.contains(index)) {
                      d = CustomeButton(
                        customeColor: Colors.grey,
                        f: (bool click) {
                          if (click) {
                            BlocProvider.of<SelectMuiltTypeCubit>(context)
                                .addToList(index);
                          } else {
                            BlocProvider.of<SelectMuiltTypeCubit>(context)
                                .removeToList(index);
                          }
                        },
                        click: true,
                        text: widget.list[index].keys.toList()[0],
                      );
                    } else {
                      d = CustomeButton(
                        customeColor: Colors.grey,
                        f: (bool click) {
                          if (click) {
                            BlocProvider.of<SelectMuiltTypeCubit>(context)
                                .addToList(index);
                          } else {
                            BlocProvider.of<SelectMuiltTypeCubit>(context)
                                .removeToList(index);
                          }
                        },
                        click: false,
                        text: widget.list[index].keys.toList()[0],
                      );
                    }
                    return d;
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class CustomeButton extends StatefulWidget {
  String text;
  bool click;
  Function f;
  Color customeColor;
  CustomeButton({
    Key? key,
    required this.text,
    required this.customeColor,
    required this.click,
    required this.f,
  }) : super(key: key);

  @override
  State<CustomeButton> createState() => _CustomeButtonState();
}

class _CustomeButtonState extends State<CustomeButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.resolveWith((states) =>
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                  side: const BorderSide(color: Colors.grey))),
          backgroundColor: MaterialStateProperty.resolveWith(
              (states) => widget.click ? widget.customeColor : null)),
      onPressed: () {
        widget.click = !widget.click;
        widget.f(widget.click);
        setState(() {});
      },
      child: Text(widget.text, style: const TextStyle(color: Colors.black)),
    );
  }
}

class GoogleMapComponent extends StatefulWidget {
  const GoogleMapComponent({super.key});

  @override
  State<GoogleMapComponent> createState() => _GoogleMapComponentState();
}

class _GoogleMapComponentState extends State<GoogleMapComponent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.white,
                )),
            margin: const EdgeInsets.all(10),
            child: TextFormField(
              validator: (value) {},
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'المساحة الكلية للمزرعة'),
              keyboardType: TextInputType.number,
            ),
          ),
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            height: 50,
            child: TextButton(
                onPressed: () async {
                  launchUrlString(
                      'https://www.google.com/maps/place/%D9%85%D8%B4%D8%AA%D9%84+%D8%AF%D9%85%D9%8A%D8%A7%D8%B7+%D8%A7%D9%84%D8%AC%D8%AF%D9%8A%D8%AF%D9%87+%D9%85%D8%A7%D8%B3%D9%87+%D9%81%D9%84%D9%88%D8%B1%E2%80%AD/@31.4375592,31.6625208,15z/data=!4m8!1m2!3m1!2z2YXYt9i52YUg2KfYqNmGINin2YTYr9mK2YPigK0!3m4!1s0x14f9e3b19117100d:0x7afd6519c0a84ac7!8m2!3d31.4375566!4d31.6609561');
                },
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                child: Text(
                  'تغير ال google map',
                  style: TextStyle(color: Colors.brown),
                )),
          ),
        )
      ],
    );
  }
}
