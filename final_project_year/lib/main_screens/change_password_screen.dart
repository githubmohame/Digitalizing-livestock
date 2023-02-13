import 'package:final_project_year/common_component/background.dart';
import 'package:final_project_year/common_component/custome_password_field.dart';
import 'package:final_project_year/common_component/main_diwer.dart';
import 'package:flutter/material.dart' hide Stepper, Step, StepperType;
import 'package:final_project_year/common_component/custome_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  int x = 0;
  @override
  Widget build(BuildContext context) {
    return BackgroundScreen( 
      child: Directionality(textDirection: TextDirection.rtl,
        child: LayoutBuilder(
          builder: (context,constraint) {
            return Scaffold(backgroundColor: Colors.transparent,drawer: MainDrawer(index: 10,),
              appBar: constraint.maxWidth<900?AppBar(elevation: 0,
                backgroundColor: Colors.transparent,
                title: const Center(
                    child: Center(
                        child: Text(
                  'تغير الرقم السري',
                  style: TextStyle(color: Colors.white),
                ))),
              ):null,
              body: Column(
                children: [
                 constraint.maxWidth>900?Container(height: 100, child: ComputerDrawer(index:10)):Container(),
                  Spacer(),
                  Card(color: Color(0xFF467061),elevation: 20,
                    child: Container(width: 600,
                      child: SingleChildScrollView(
                        child: SafeArea(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 260,
                                    color: Colors.transparent,
                                    child: Theme(
                                      data: ThemeData(
                                        primaryColor: Colors.green,
                                        colorScheme: const ColorScheme.light(),
                                        canvasColor: Colors.transparent,
                                      ),
                                      child: Container(
                                          height: 200,
                                          child: CustomeStepper(
                                              margin: const EdgeInsets.all(5),
                                              elevation: 0,
                                              onStepContinue: x < 2
                                                  ? () {
                                                      setState(() {
                                                        x += 1;
                                                      });
                                                    }
                                                  : x == 2
                                                      ? () {}
                                                      : null,
                                              onStepCancel: x > 0
                                                  ? () {
                                                      x -= 1;
                                                      setState(() {});
                                                    }
                                                  : null,
                                              currentStep: x,
                                              onStepTapped: (value) {
                                                setState(() {
                                                  x = value;
                                                });
                                              },
                                              type: StepperType.horizontal,
                                              controlsBuilder: (context, details) {
                                                return Container(
                                                    child: Row(
                                                  children: [
                                                    TextButton(
                                                      onPressed: details.onStepContinue,
                                                      child: Text(
                                                        x == 2 ? 'حفظ' : 'استكمال',
                                                        style: TextStyle(color: Colors.white),
                                                      ),
                                                      style: ButtonStyle(backgroundColor:
                                                          MaterialStateProperty.resolveWith(
                                                              (states) {
                                                        if (details.onStepContinue == null) {
                                                          return Colors.brown;
                                                        } else if (x == 2)
                                                          return Colors.green;
                                                        else {
                                                          return Colors.brown.shade300;
                                                        }
                                                      })),
                                                    ),
                                                    x == 0
                                                        ? Container()
                                                        : TextButton(
                                                            onPressed: details.onStepCancel,
                                                            child: const Text(
                                                              'تراجع',
                                                              style:
                                                                  TextStyle(color: Colors.white),
                                                            ),
                                                            style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty
                                                                      .resolveWith((states) =>
                                                                          details.onStepCancel ==
                                                                                  null
                                                                              ? Colors.brown
                                                                              : Colors.brown
                                                                                  .shade300),
                                                            ))
                                                  ],
                                                ));
                                              },
                                              steps: [
                                                Step(
                                                    isActive: x == 0,
                                                    title: const Text("ادخل البريد الاليكتروني"),
                                                    content: Container(
                                                      height: 60,
                                                      color: Colors.white,
                                                      child: Column(
                                                        children: const [
                                                          TextField(
                                                            keyboardType:
                                                                TextInputType.emailAddress,
                                                            decoration: InputDecoration(
                                                                focusColor: Colors.white,
                                                                enabledBorder: OutlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                  color: Colors.white,
                                                                )),
                                                                focusedBorder: OutlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                  color: Colors.white,
                                                                )),
                                                                border: OutlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                  color: Colors.white,
                                                                )),
                                                                hintText: "البريد الاليكتروني"),
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                                Step(
                                                    isActive: x == 1,
                                                    title: const Text(
                                                      'التأكيد',
                                                    ),
                                                    content: Container(
                                                      color: Colors.transparent,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                              "لقد قمنا بارسال كود لك على البريد الالكتروني من فضلك ادخل الكود",
                                                              style: TextStyle(
                                                                  color: Colors.black)),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          const TextField(
                                                            decoration: InputDecoration(
                                                                fillColor: Colors.white,
                                                                focusColor: Colors.white,
                                                                enabledBorder: OutlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                  color: Colors.white,
                                                                )),
                                                                focusedBorder: OutlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                  color: Colors.white,
                                                                )),
                                                                filled: true,
                                                                border: OutlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                  color: Colors.white,
                                                                )),
                                                                hintText: " ادخل الكود"),
                                                          )
                                                        ],
                                                      ),
                                                    )),
                                                Step(
                                                    isActive: x == 2,
                                                    title: const Text(
                                                      'ادخل الرقم السري',
                                                    ),
                                                    content: CustomePasswordEnterTextField(widgetIndex: 9,))
                                              ]),
                                        )
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ),Spacer()
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}


/*
  Step(
                               
                                  content: )

*/