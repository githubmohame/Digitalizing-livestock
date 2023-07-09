// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

class CustomePasswordEnterTextField extends StatefulWidget {
  int widgetIndex;
  CustomePasswordEnterTextField({
    Key? key,
    required this.widgetIndex,
  }) : super(key: key);
  String? password;
  GlobalKey<FormState> f = GlobalKey<FormState>();
  @override
  State<CustomePasswordEnterTextField> createState() =>
      _CustomePasswordEnterTextFieldState();
}

class _CustomePasswordEnterTextFieldState
    extends State<CustomePasswordEnterTextField> {
  bool showPassword = false;
  final List<TextEditingController> controller = [
    TextEditingController(),
    TextEditingController(),
  ];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.f,
      child: Container(
        height: 138 + 24,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller[0],
              obscureText: !showPassword,
              obscuringCharacter: '*',
              decoration: const InputDecoration(
                  errorStyle: TextStyle(color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  fillColor: Colors.white,
                  focusColor: Colors.brown,
                  filled: true,
                  hintText: " ادخل الرقم السري"),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: controller[1],
              obscureText: !showPassword,
              validator: (value) {
                if (controller[0].text != controller[1].text ||
                    controller[0].text.isEmpty) {
                  return 'يجب ان يتطابف الرمز مع تاكيدة';
                }
                widget.password = controller[0].text;
                return null;
              },
              obscuringCharacter: '*',
              decoration: const InputDecoration(
                  errorStyle: TextStyle(color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  fillColor: Colors.white,
                  focusColor: Colors.brown,
                  filled: true,
                  hintText: " ادخل تاكيد الرقم السري"),
            ),
            Row(
              children: [
                Checkbox(
                    side: const BorderSide(color: Colors.white),
                    value: showPassword,
                    onChanged: (value) {
                      setState(() {
                        showPassword = value ?? false;
                      });
                    }),
                const Text('اظهار كلمة المرور',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w100))
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (TextEditingController f in controller) {
      f.dispose();
    }
    super.dispose();
  }
}

class CustomePasswordUpdateTextField extends StatefulWidget {
  CustomePasswordUpdateTextField({super.key});
  TextEditingController controller = TextEditingController();
  @override
  State<CustomePasswordUpdateTextField> createState() =>
      _CustomePasswordUpdateTextFieldState();
}

class _CustomePasswordUpdateTextFieldState
    extends State<CustomePasswordUpdateTextField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: widget.controller,
            obscureText: !showPassword,
            obscuringCharacter: '*',
            decoration: const InputDecoration(
                fillColor: Colors.white,
                focusColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.brown,
                )),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.brown,
                )),
                prefixIcon: Icon(
                  Icons.password,
                  color: Colors.grey,
                ),
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.brown,
                )),
                hintText: " ادخل تاكيد الرقم السري"),
          ),
          Row(
            children: [
              Checkbox(
                  side: const BorderSide(color: Colors.black),
                  value: showPassword,
                  onChanged: (value) {
                    setState(() {
                      showPassword = value ?? false;
                    });
                  }),
              const Text('اظهار كلمة المرور',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w100))
            ],
          )
        ],
      ),
    );
  }
}
