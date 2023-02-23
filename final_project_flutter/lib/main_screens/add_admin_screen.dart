
import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:final_project_year/main_screens/farm_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/choice/cubit/choice_cubit.dart';

class AddAdmin extends StatelessWidget {
  const AddAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BackgroundScreen(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              'تسجيل المدرين',
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.transparent,
          drawer: MainDrawer(index: 9),
          body: SingleChildScrollView(
            child: Center(
              child: Card(
                elevation: 20,
                color: Color(0xFF467061),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 700,
                      child: Form(
                          child: Flex(
                        direction: Axis.vertical,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.person,
                              color: Colors.grey, size: 50),
                          TextField(
                              contextMenuBuilder: (context, editableTextState) {
                                final TextEditingValue value =
                                    editableTextState.textEditingValue;
                                final List<ContextMenuButtonItem> buttonItems =
                                    editableTextState.contextMenuButtonItems;
                                editableTextState.contextMenuAnchors;
                                return TextButton(
                                    onPressed: () {}, child: Text('data'));
                              },
                              keyboardType: TextInputType.text,
                              style: TextStyle(color: Colors.brown),
                              decoration: InputDecoration(
                                  filled: true, //<-- SEE HERE
                                  fillColor: Colors.white,
                                  hintText: "ادخل الاسم",
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.brown,
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2)),
                                  focusColor: Colors.grey,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2)))),
                          const SizedBox(height: 20),
                          const TextField(
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.brown),
                              decoration: InputDecoration(
                                  filled: true, //<-- SEE HERE
                                  fillColor: Colors.white,
                                  hintText: "ادخل الرقم القومي",
                                  prefixIcon: Icon(
                                    Icons.security,
                                    color: Colors.brown,
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2)),
                                  focusColor: Colors.grey,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2)))),
                          const SizedBox(height: 20),
                          const TextField(
                              obscureText: true,
                              obscuringCharacter: '*',
                              style: TextStyle(color: Colors.brown),
                              decoration: InputDecoration(
                                  filled: true, //<-- SEE HERE
                                  fillColor: Colors.white,
                                  hintText: "اكتب الرقم السري",
                                  prefixIcon: Icon(
                                    Icons.password,
                                    color: Colors.brown,
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 5)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2)),
                                  focusColor: Colors.grey,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2)))),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 250,
                            child: Row(
                              children: [
                                Expanded(
                                    child: BlocProvider(
                                  create: (context) => ChoiceCubit(
                                      city: 0, gavernorate: 0, village: 0),
                                  child: SelectLocation(),
                                )),
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 200,
                            child: TextButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    shape:
                                        MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                                side: const BorderSide(
                                                    color: Colors.red))),
                                    backgroundColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) => Colors.grey),
                                    side: MaterialStateProperty.resolveWith(
                                        (states) => const BorderSide(
                                            color: Colors.grey,
                                            style: BorderStyle.solid))),
                                child: const Text('تسجيل المدير', style: TextStyle(color: Colors.white))),
                          ),
                        ],
                      )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool isValidEmail(String textInside) {
    return true;
  }
}
