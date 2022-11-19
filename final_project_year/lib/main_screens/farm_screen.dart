import 'package:final_project_year/bloc/choice/cubit/choice_cubit.dart';
import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:final_project_year/main_screens/Show_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:final_project_year/bloc/select_muilt_type/cubit/select_muilt_type_cubit.dart';

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
              isExpanded: widget.expanded,
              underline: Container(),
              focusColor: Colors.transparent,
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
  return Future<List>.delayed(Duration(seconds: 10)).then((value) => [
        {"kill": 'see'}
      ]);
}

class FarmScreen extends StatelessWidget {
  const FarmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        drawer: MainDrawer(index: 0),
        appBar: AppBar(
            backgroundColor: Color(0x0FFFb0b348), title: Text("اضافه المزرعة")),
        body: SingleChildScrollView(
          child: Form(
              child: Column(
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey,
                )),
                padding: EdgeInsets.all(10),
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
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "اعدد الملاعب"),
                  keyboardType: TextInputType.number,
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey,
                )),
                padding: EdgeInsets.all(10),
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
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "اعدد العنابر"),
                  keyboardType: TextInputType.number,
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey,
                )),
                padding: EdgeInsets.all(10),
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
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "ادخل رابط موقع المزرعة من google map (url)"),
                  keyboardType: TextInputType.url,
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey,
                )),
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  validator: (value) {},
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "ادخل عدد الافدنة الملحقة"),
                  keyboardType: TextInputType.number,
                ),
              ),
              Container(
                height: 70,
                padding: EdgeInsets.all(0),
                child: CustomeDropdownButton(
                  list: [
                    {"id": 0, "name": "عام"},
                    {"id": 1, "name": "خاص"}
                  ],
                  expanded: true,
                  text: "نوع القطاع",
                  value: 0,
                ),
              ),
              Container(
                height: 200,
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
                  child: CustomeType(
                    title: "نوع المزرعة",
                    list: [
                      {"kill me": 1},
                      {"go to hell": 0}
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              OutlinedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(200, 50)),
                    shape: MaterialStateProperty.resolveWith((states) =>
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.grey),
                    overlayColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.green)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowInfoScreen(),
                      ));
                },
                child: Text(
                  "حفظ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

class SelectLocation extends StatefulWidget {
  SelectLocation({Key? key,this.village}) : super(key: key);
  String? village;
  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.grey,
            )),
            child: CustomeDropdownButton(
                func: (int value) {
                  BlocProvider.of<ChoiceCubit>(context)
                      .updateGavernorate(value);
                },
                list: [
                  {"id": 0, "name": "اسيوط"},
                  {"id": 1, "name": "القاهرة"},
                  {"id": 2, "name": "المنةفية"}
                ],
                expanded: true,
                value: 0,
                text: "المحافظة")),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.grey,
          )),
          child: BlocBuilder<ChoiceCubit, ChoiceState>(
            buildWhen: (previous, current) {
              //
              return previous.gavernorate != current.gavernorate;
            },
            builder: (context, state) {
              print("city");
              return CustomeDropdownButton(
                  func: (int value) {
                    BlocProvider.of<ChoiceCubit>(context).updateCity(value);
                  },
                  list: [
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
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.grey,
          )),
          child: BlocBuilder<ChoiceCubit, ChoiceState>(
            buildWhen: (previous, current) {
              return previous.city != current.city ||
                  previous.gavernorate != current.gavernorate;
            },
            builder: (context, state) {
              print('village');
              return CustomeDropdownButton(
                  func: (int value) {
                    BlocProvider.of<ChoiceCubit>(context).updateVillage(value);
                  },
                  list: [
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
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                        textDirection: TextDirection.rtl,
                        size: 24,
                      )),
                  label: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(widget.title,
                          style: TextStyle(color: Colors.black)))),
            )),
        Visibility(
          visible: widget.visiable,
          child: Container(
            decoration: BoxDecoration(
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
  CustomeButton({
    Key? key,
    required this.text,
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
                  side: BorderSide(color: Colors.grey))),
          backgroundColor: MaterialStateProperty.resolveWith(
              (states) => widget.click ? Colors.green[200] : null)),
      onPressed: () {
        widget.click = !widget.click;
        widget.f(widget.click);
        setState(() {});
      },
      child: Text(widget.text, style: TextStyle(color: Colors.black)),
    );
  }
}
